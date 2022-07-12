#!/bin/bash

. setenv.sh

FILENAME="migration-script.sh"

gh gei generate-script --github-source-org $SOURCE_ORG --github-target-org $DESTINATION_ORG --output $FILENAME \
   --ghes-api-url $GHES_API_URL --azure-storage-connection-string $AZURE_STORAGE_CONNECTION_STRING
