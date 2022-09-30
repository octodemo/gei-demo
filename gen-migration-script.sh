#!/bin/bash

. setenv.sh

FILENAME="migration-script.sh"

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

gh gei generate-script --github-source-org $SOURCE_ORG --github-target-org $DESTINATION_ORG --output $FILENAME \
   $GHES_INCLUDE --download-migration-logs $LOCK_SOURCE_REPO_FLAG
