FROM node:10
 
FROM node:10

LABEL "com.github.actions.name"="Github Build & Deploy Action"
LABEL "com.github.actions.description"="This action will auto deploy to target branch when it get triggered"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/jeoy/its-me"
LABEL "homepage"="https://github.com/jeoy/github-deploy-actions"
LABEL "maintainer"="jeoy <jeoy_z@126.com>"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]