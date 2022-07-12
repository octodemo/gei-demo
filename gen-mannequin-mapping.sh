#!/bin/bash

. setenv.sh

FILENAME="usermapping"

gh gei generate-mannequin-csv --github-target-org $DESTINATION_ORG --output $FILENAME.csv