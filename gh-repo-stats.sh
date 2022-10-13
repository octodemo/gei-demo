#!/bin/bash

. setenv.sh

FILENAME="$SOURCE_ORG-repo-stats.csv"

# Check if gh-repo-stats is installed
if ! gh repo-stats --help>/dev/null  ; then    
    echo "gh-repo-stats is not installed. Please install gh-repo-stats: https://github.com/mona-actions/gh-repo-stats."
    exit 1
fi

# Check if jq is installed
if ! [ -x "$(command -v jq)" ]; then    
    echo "jq is not installed. Please install gh-repo-stats: https://stedolan.github.io/jq/."
    exit 1
fi

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--url ${GHES_API_URL%/api/v3}"
fi

gh repo-stats --org $SOURCE_ORG --token $GH_SOURCE_PAT