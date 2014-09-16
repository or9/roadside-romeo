#!/bin/bash

NEWMAN_EXECUTABLE=./node_modules/.bin/newman
COLLECTION=./postman/DAPI.json.postman_collection
ENV=./postman/DAPI.postman_environment
DATA=./postman/data_test.json
TIMESTAMP=$(date +"%s")
TARGET_DIR=./target/test
OUTFILE=$TARGET_DIR/$TIMESTAMP.newman.out.json

if [ ! -d "$TARGET_DIR" ]; then
	mkdir -p $TARGET_DIR
fi

$NEWMAN_EXECUTABLE -c $COLLECTION -e $ENV -o $OUTFILE -d $DATA
