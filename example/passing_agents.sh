#!/bin/bash

./bin/HFO --port=6009 --offense-agents=2 --no-sync --fullstate &
sleep 5
./example/communication_agent 6009 &
sleep 5
./example/communication_agent 6009 &

# The magic line
#   $$ holds the PID for this script
#   Negation means kill by process group id instead of PID
trap "kill -TERM -$$" SIGINT
wait
