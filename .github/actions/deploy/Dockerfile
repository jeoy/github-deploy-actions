FROM node:10
 
LABEL "repository"="https://github.com/jeoy/github-deploy-actions"
LABEL "maintainer"="jeoy <jeoy_z@126.com>"


ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]