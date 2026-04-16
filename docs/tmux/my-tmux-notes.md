Rename ession in commandline:
`tmux rename-session -t<current-session-name> <new-session-name>`

# Tmux workflow:

1. cd into dev directory 
2. `tmux new-session -A -s dev`
3. prefix+d - detatch out of session 
4. `cd`
5. `tmux new-session -A -s general`
6. prefix+s to switch between `dev` an `general`

I automated this process in `load-tmux-env.sh`
It's based on this: https://tmuxai.dev/tmux-startup-script/
