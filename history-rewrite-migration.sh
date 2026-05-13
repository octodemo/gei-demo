#!/bin/bash

gh history-rewrite-migration migrate \
  --org "${SOURCE_ORG}" \
  --repo "${SOURCE_REPO_NAME}" \
  --target-org "${TARGET_ORG}" \
  --strip-large-files \
  --large-file-threshold 50M \
  --use-github-storage