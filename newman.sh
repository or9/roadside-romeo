#!/bin/bash

NEWMAN_EXECUTABLE=./node_modules/.bin/newman
COLLECTION=./postman/DAPI.json.postman_collection
ENVIRONMENT=./postman/DAPI.postman_environment
TIMESTAMP=$(date +"%s")
TARGET_DIR=./target/test
OUTFILE=$TARGET_DIR/$TIMESTAMP.newman.out.json

if [ ! -d "$TARGET_DIR" ]; then
	mkdir -p $TARGET_DIR
fi

$NEWMAN_EXECUTABLE -c $COLLECTION -e $ENVIRONMENT -o $OUTFILE
