#!/bin/bash

. setenv.sh

FILENAME="migration-script.ps1"

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    if [ -z "$AWS_SECRET_KEY" ]; then
        GHES_INCLUDE="--ghes-api-url $GHES_API_URL"
    else
        GHES_INCLUDE="--ghes-api-url $GHES_API_URL --aws-bucket-name $AWS_BUCKET_NAME"
    fi  
fi

if [ "$LOCK_SOURCE_REPO" = "true" ]; then
    LOCK_SOURCE_REPO_FLAG="--lock-source-repo"
else
    LOCK_SOURCE_REPO_FLAG=""
fi

gh gei generate-script --github-source-org "$SOURCE_ORG" --github-target-org "$TARGET_ORG" --output "$FILENAME" \
   --download-migration-logs $LOCK_SOURCE_REPO_FLAG $GHES_INCLUDE

chmod +x $FILENAME