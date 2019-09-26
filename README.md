### This action will auto deploy to target branch when it get triggered

When push to `master` branch

This Action will run `yarn && yarn build`

Then push `build` folder as a new commit on `gh-pages` branch

> note: mark sure `build` folder is on your gitignore list
