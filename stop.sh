#!/bin/bash

# Check if MongoDB is running on port 28018
# If so, kill it

ROADSIDE_MONGO_RUNNING = $(ps -ef | grep "mongod" | grep -v "grep" | wc -l)

exit $?
