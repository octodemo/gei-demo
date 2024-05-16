#!/bin/bash

. setenv.sh

# Check if node is installed
if ! [ -x "$(command -v node)" ]; then    
    echo "Node.js is not installed. Please install node.js: https://nodejs.org/."
    exit 1
fi

if [ -z "$GHES_API_URL" ]; then
    GHES_INCLUDE=""
else
    GHES_INCLUDE="--server ${GHES_API_URL%/v3}/graphql"
fi
if [ ! -d gh-migration-analyzer ]; then
    git clone https://github.com/github/gh-migration-analyzer.git
    cd gh-migration-analyzer
    npm install
    cd ..
fi
cd gh-migration-analyzer
node src/index.js GH-org --organization $SOURCE_ORG --token $GH_SOURCE_PAT $GHES_INCLUDE