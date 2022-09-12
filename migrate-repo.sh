#!/bin/bash

. setenv.sh

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--ghes-api-url $GHES_API_URL --azure-storage-connection-string $AZURE_STORAGE_CONNECTION_STRING"
fi

if [ "$LOCK_SOURCE_REPO" = "true" ]; then
    LOCK_SOURCE_REPO_FLAG="--lock-source-repo"
else
    LOCK_SOURCE_REPO_FLAG=""
fi

gh gei migrate-repo --github-source-org $SOURCE_ORG --source-repo $CURRENT_REPO_NAME --github-target-org $DESTINATION_ORG --target-repo $NEW_REPO_NAME \
    $GHES_INCLUDE $LOCK_SOURCE_REPO_FLAG