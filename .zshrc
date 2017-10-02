alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

alias tmux='tmux -2'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
      iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

export TERM="xterm-256color"

if [ "$HOST" = 'josh-spa' ]
then
    tmux_sessions=`tmux ls` &> /dev/null

    if [ "$?" -ne 0 ]
    then
        ./pserve.sh
        ./dev_env.sh
    fi
fi

# if [ echo $tmux_sessions | grep dev &> /dev/null -eq 1 ]
# then
#     ./dev_env.sh
# fi
#
# if [ echo $tmux_sessions | grep spa_backend &> /dev/null -eq 1 ]
# then
#     ./pserve.sh
# fi
# 
# alias vim=nvim

export EDITOR=vim

# 10ms for key sequences
KEYTIMEOUT=1

alias current_branch='git branch | grep "*" | sed  "s/* //"'
