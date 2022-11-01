#!/bin/bash

. setenv.sh

gh gei migrate-org --github-source-org "$SOURCE_ORG" --github-target-org "$DESTINATION_ORG" --github-target-enterprise $ENTERPRISE