#!/bin/bash

FILENAME="./$SOURCE_ORG-repo-stats.csv"

# Check if gh-repo-stats is installed
if ! gh repo-stats-plus --help>/dev/null  ; then    
    echo "gh-repo-stats-plus is not installed. Please install gh-repo-stats: https://github.com/mona-actions/gh-repo-stats-plus."
    gh extension install mona-actions/gh-repo-stats-plus
    if [ $? -eq 0 ]; then
        echo "Continue..."      
    else
      echo "Unable to install gh-repo-stats-plus."
      exit 1
    fi
fi

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--base-url ${GHES_API_URL}"
fi

gh repo-stats-plus repo-stats --org-name $SOURCE_ORG --access-token $GH_SOURCE_PAT $GHES_INCLUDE
