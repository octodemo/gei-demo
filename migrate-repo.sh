#!/bin/bash

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--ghes-api-url $GHES_API_URL"
fi

if [ -z "$AWS_SECRET_KEY" ]; then
    BLOB_INCLUDE=""
else
    echo "Using AWS S3 for blob storage"
    BLOB_INCLUDE="--aws-bucket-name $AWS_BUCKET_NAME"
fi

if [ "$USE_GITHUB_STORAGE" = "true" ]; then
    echo "Using GitHub Storage for blob storage"
    GHES_INCLUDE="$GHES_INCLUDE --use-github-storage"
fi

if [ "$LOCK_SOURCE_REPO" = "true" ]; then
    LOCK_SOURCE_REPO_FLAG="--lock-source-repo"
else
    LOCK_SOURCE_REPO_FLAG=""
fi

gh gei migrate-repo --github-source-org "$SOURCE_ORG" --source-repo "$SOURCE_REPO_NAME" --github-target-org "$TARGET_ORG" --target-repo "$TARGET_REPO_NAME" \
    $GHES_INCLUDE $BLOB_INCLUDE $LOCK_SOURCE_REPO_FLAG