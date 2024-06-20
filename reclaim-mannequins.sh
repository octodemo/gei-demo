#!/bin/bash

. setenv.sh

FILENAME="usermapping.csv"

 if gh gei reclaim-mannequin --github-target-org $TARGET_ORG --csv $FILENAME --skip-invitation; then
    echo "Mannequins reclaimed successfully"
else
    echo "Mannequins not reclaimed successfully"
    exit 1
fi