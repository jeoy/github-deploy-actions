#! /bin/sh -l
#! /bin/bash

set -e

if [ -z "$SECRET_TOKEN" ]
then
  echo "SECRET_TOKEN is required"
  exit 1
fi

if [ -z "$COMMIT_EMAIL" ]
then
  echo "COMMIT_EMAIL is required"
  exit 1
fi

if [ -z "$FOLDER" ]
then
  echo "deploy FOLDER is required"
  exit 1
fi


apt-get update && \
apt-get install -y git && \


if [ -z "$COMMIT_NAME" ]
then
  COMMIT_NAME="${GITHUB_ACTOR}"
fi

# Directs the action to the the Github workspace.
cd $GITHUB_WORKSPACE && \

# Configures Git.
git init && \
git config --global user.email "${COMMIT_EMAIL}" && \
git config --global user.name "${COMMIT_NAME}" && \


## Initializes the repository path using the access token.
REPOSITORY_PATH="https://${SECRET_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \


# Builds the project if a build script is provided.
echo "-----------------------Running build scripts... ---------------" 

eval "$BUILD_SCRIPT" && \

echo "---------checkout---to---${DEPLOY_BRANCH:-gh-pages}-----"
git checkout --orphan "${DEPLOY_BRANCH:-gh-pages}" && \

git rm -rf . && \

if [ "$(git ls-remote --heads "$REPOSITORY_PATH" "${DEPLOY_BRANCH:-gh-pages}" | wc -l)" -ne 0 ];
then
  echo "----- ${DEPLOY_BRANCH:-gh-pages} already exist-----sync origin----"
  git pull origin "${DEPLOY_BRANCH:-gh-pages}"
fi

shopt -s extglob

rm -rf !($FOLDER) && cp -r  $FOLDER/.  ./ && rm -r $FOLDER && \

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to deploy"
else
  git add . && \
  
  git commit -m "Deploying ${DEPLOY_BRANCH:-gh-pages} from ${BASE_BRANCH:-master} ${GITHUB_SHA}"
  
  git push $REPOSITORY_PATH "${DEPLOY_BRANCH:-gh-pages}"
fi

echo "------- deploy successful ----------- "