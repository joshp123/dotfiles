#!/bin/bash

source ~/env/bin/activate
tmux new-session -s dev -d

tmux rename-window 'git'
tmux send-keys 'cd ~/projects/'
tmux send-keys ENTER

tmux new-window 'vim'
tmux send-keys 'cd ~/projects/'
tmux send-keys ENTER
tmux send-keys 'vim'
tmux send-keys ENTER
