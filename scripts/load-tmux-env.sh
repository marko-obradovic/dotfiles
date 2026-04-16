#!/bin/bash

# Usage: set the dev path with the -p flag. Defaults to home if nothing provided

# Exit if tmux session already exists
tmux has-session -t dev 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Session already exists. Attaching..."
  tmux attach -t dev
  exit 0
fi

SESSION_PATH="~"

while getopts "p:" flag; do
  case $flag in
  p) SESSION_PATH=$OPTARG ;;
  \?) echo "Incorrect flag usage. Use -p <directory-path>" ;;
  esac
done

# Start a new tmux session named "dev"
tmux new-session -c ~ -d -s general
tmux new-window -t general:2 -n "dotfiles" -c ~/dotfiles
tmux new-window -t general:3 -n "software-dev-notes" -c ~/Documents/software-dev-notes/
tmux new-session -c $SESSION_PATH -A -s dev
