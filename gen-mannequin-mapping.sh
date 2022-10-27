#!/bin/bash

. setenv.sh

FILENAME="usermapping.csv"

gh gei generate-mannequin-csv --github-target-org $DESTINATION_ORG --output $FILENAME