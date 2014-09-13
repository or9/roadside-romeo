#!/bin/bash

DIRECTORY=data
MONGO_RUNNING=$(ps -ef | grep "mongod" | grep -v "grep" | wc -l)
PORT=28018

git pull
npm install

if [ ! -d "$DIRECTORY" ]; then
	mkdir data
fi

if [ ! $MONGO_RUNNING ]; then
	echo 2>&1 "Starting MongoDB…"
	mongod --config ./mongodb.config --dbpath ./$DIRECTORY --port $PORT &
else
	echo 2>&1 "MongoDB is already running."
fi

node bin/www

exit $?
