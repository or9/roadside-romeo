#!/bin/bash

DIRECTORY=./.data
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
	PIDFILE=./mongodb.pid
	PID=$(cat $PIDFILE)
	pkill -signal SIGINT roadside-romeo
	echo "killing mongodb instance by PID ($PID)"
	if [ ! -f "$PIDFILE" ]; then
		kill $(pgrep mongod)
	else
		kill -F $PIDFILE
	fi
	if [ -d "./mongodb.pid" ]; then
		rm -v ./mongodb.pid
	fi
}

$1

exit $?
