#!/bin/bash

if [ ! -z "$1" ]; then
    betaSuffix="-$1"
    publishSuffix="--tag $1"
fi

# Get the last tag from GitHub
lastTag=$(git describe --long --tags --dirty --always)

major=$(echo "$lastTag" | awk -F '.' '{print $1}')
minor=$(echo "$lastTag" | awk -F '.' '{print $2}')
metadata=$(echo "$lastTag" | awk -F '.' '{print $3}')
patch=$(echo "$metadata" | awk -F '-' '{print $1}')
commit=$(echo "$metadata" | awk -F '-' '{print $2}')
sha=$(echo "$metadata" | awk -F '-' '{print $3}')
dirty=$(echo "$metadata" | awk -F '-' '{print $4}')

if [[ -n "${dirty}" ]]; then
  dirty="-${dirty}"
fi

newVersion=$major.$minor.$patch-$commit$betaSuffix.$sha$dirty

# Bump the version
npm --no-git-tag-version version $newVersion

# Publish to NPM
npm publish $publishSuffix
