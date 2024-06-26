#!/bin/bash

. $(dirname "$0")/setenv.sh

REPO=$(basename $(git rev-parse --show-toplevel))

echo "Updating origin to https://github.com/${TARGET_ORG}/${REPO}"
git remote remove origin
git remote add origin https://github.com/${TARGET_ORG}/${REPO}