#!/bin/bash

. setenv.sh

if [ -z $1 ]; then
    echo "Usage: $0 <migration-id>"
    exit 1
else
    ID=$1
fi

curl \
  -X DELETE \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GH_SOURCE_PAT" \
  $GHES_API_URL/orgs/$SOURCE_ORG/migrations/$ID/archive

curl \
  -X DELETE \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GH_SOURCE_PAT" \
  $GHES_API_URL/orgs/$SOURCE_ORG/migrations/$ID/repos/$CURRENT_REPO_NAME/lock