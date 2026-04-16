#!/bin/bash

SESSION_PATH

# Start a new tmux session named "dev"
tmux new-session -c $SESSION_PATH -D -s dev

# set session-path to a path determined by a flag provided in the script
#
