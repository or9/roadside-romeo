#!/bin/bash

DIRECTORY=.data
PORT=17017

function start() {
	git pull
	npm install

	if [ ! -d "$DIRECTORY" ]; then
		mkdir $DIRECTORY
	fi

	echo 2>&1 "Starting MongoDB…"
	mongod --dbpath ./$DIRECTORY --port $PORT --pidfilepath ./mongodb.pid &
	node bin/www
}

function stop() {
	pkill --signal SIGINT roadside-romeo
	echo "stopping mongodb instance"
	kill $(cat ./.pid)
	rm -v ./mongodb.pid
}

$1

exit $?
