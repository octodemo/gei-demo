#!/bin/bash

. setenv.sh

FILENAME="usermapping.csv"

gh gei generate-mannequin-csv --github-target-org $TARGET_ORG --output $FILENAME