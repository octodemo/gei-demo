#!/bin/bash
set -e

repo_file="repos.txt"
while IFS= read -r repo
do
  echo "processing $repo"
  ./migrate-repo.sh $repo $repo
done < "$repo_file"