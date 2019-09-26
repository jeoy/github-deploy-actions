# Github-deploy-actions

This action will auto deploy to target branch when it get triggered

# How It Works

When push to `master` branch

This Action will run `yarn && yarn build`

Then push `build` folder as a new commit on `gh-pages` branch

> note: mark sure `build` folder is on your gitignore list

# deploy page:

[demo](https://jeoy.github.io/github-deploy-actions/)

## what exactly is done during the action

checkout this
[shell](https://github.com/jeoy/github-deploy-actions/blob/develop/.github/actions/deploy/entrypoint.sh)
