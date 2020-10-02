#!/usr/bin/env bash
export PATH=$(npm bin):$PATH

VERSION=`auto version`

## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then
  ## Publish Package
  npm version $VERSION -m "Bump version to: %s [skip ci]"
  npm publish

  ## Create GitHub Release
  git push --follow-tags --set-upstream origin $branch
  auto release
fi
