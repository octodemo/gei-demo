#!/bin/bash

. setenv.sh

gh gei migrate-org --github-source-org "$SOURCE_ORG" --github-target-org "$TARGET_ORG" --github-target-enterprise $TARGET_ENTERPRISE