#!/bin/bash

. setenv.sh

# Check if gh-migration-audit is installed
if ! gh migration-audit --help>/dev/null  ; then    
    echo "gh-migration-audit is not installed. Please install gh-migration-audit: https://github.com/timrogers/gh-migration-audit."
    gh extension install timrogers/gh-migration-audit
    if [ $? -eq 0 ]; then
        echo "Continue..."      
    else
      echo "Unable to install gh-migration-audit."
      exit 1
    fi
fi

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--base-url $GHES_API_URL"
fi

gh migration-audit audit-all \
    --access-token $GH_SOURCE_PAT \
    --owner $SOURCE_ORG \
    --owner-type organization \
    --output-path octocat.csv \
    --verbose \
    --skip-archived \
    $GHES_INCLUDE