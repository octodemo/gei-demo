#!/bin/bash

. setenv.sh

# Lock repos
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GH_SOURCE_PAT" \
  $GHES_API_URL/orgs/$SOURCE_ORG/migrations \
  -d "{\"repositories\":[\"$CURRENT_REPO_NAME\"],\"lock_repositories\":true}"