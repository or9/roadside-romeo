#!/bin/bash

DIRECTORY=data
PORT=17017
MONGO_RUNNING=$(ps -ef | grep "mongod" | grep "port $PORT" | grep -v "grep" | wc -l)

function start() {
	git pull
	npm install

	if [ ! -d "$DIRECTORY" ]; then
		mkdir data
	fi

	if [ ! $MONGO_RUNNING ]; then
		echo 2>&1 "Starting MongoDB…"
		mongod --dbpath ./$DIRECTORY --port $PORT --pidfilepath ./.pid &
	else
		echo 2>&1 "MongoDB is already running."
	fi

	node bin/www
	return $?
}

function stop() {
	# Check if MongoDB is running on port 17017
	# If so, kill it
	echo "stopping mongodb instance"
	kill $(cat ./.pid)
	rm -v ./.pid
	return $?
}

$1

exit $?
