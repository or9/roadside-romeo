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
	node --harmony bin/www
}

function stop() {
	PIDFILE=./mongodb.pid
	PID=$(cat $PIDFILE)
	pkill -signal SIGINT roadside-romeo
	echo "killing mongodb instance by PID ($PID)"
	kill $(pgrep mongod)
	if [ -f "./mongodb.pid" ]; then
		rm -v ./mongodb.pid
	fi
}

$1

exit $?
