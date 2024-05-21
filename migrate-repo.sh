#!/bin/bash

. setenv.sh

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    if [ -z "$AWS_SECRET_KEY" ]; then
        echo "Using Azure Storage Account for blob storage"
        GHES_INCLUDE="--ghes-api-url $GHES_API_URL"
    else
        echo "Using AWS S3 for blob storage"
        GHES_INCLUDE="--ghes-api-url $GHES_API_URL --aws-bucket-name $AWS_BUCKET_NAME"
    fi  
fi

if [ "$LOCK_SOURCE_REPO" = "true" ]; then
    LOCK_SOURCE_REPO_FLAG="--lock-source-repo"
else
    LOCK_SOURCE_REPO_FLAG=""
fi

gh gei migrate-repo --github-source-org "$SOURCE_ORG" --source-repo "$SOURCE_REPO_NAME" --github-target-org "$TARGET_ORG" --target-repo "$TARGET_REPO_NAME" \
    $GHES_INCLUDE $LOCK_SOURCE_REPO_FLAG