alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

export LANG=en_US.UTF-8

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


eval "$(pyenv init -)"
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv virtualenv-init -)"

# For SSH Host Completion - Zsh Style
# use ~/code/puppy/allemaal, ~/.ssh/known_hosts and /etc/hosts for hostname completion
[ -r ~/code/puppy/allemaal ] && _mx_hosts=($(<$HOME/code/puppy/allemaal)) || _mx_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_mx_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  `hostname`
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin/
export GOPATH=~/go

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Josh/code/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/Josh/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Josh/code/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/Josh/code/google-cloud-sdk/completion.zsh.inc'; fi

export GIT_AUTHOR_NAME="Josh Palmer"
export GIT_AUTHOR_EMAIL="Josh.Palmer@mendix.com"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
export JAVA_HOME=$(/usr/libexec/java_home)

# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

alias cp_logs_test='ssh -t  tr10000@appnode-scherzo.cloud.xs4.mendix.net "cd /srv/cloud/logs/tr10000/ && less +F runtime.log; bash -i"'
alias cp_logs_prod='ssh -t  tr10000@appnode-prostitute.cloud.xs4.mendix.net "cd /srv/cloud/logs/tr10000/ && less +F runtime.log; bash -i"'
alias test_urlsign='java -jar ~/code/urlsign/target/urlsign-full-1.0-SNAPSHOT.jar ~/code/urlsign/test_key'

launch_aws_workspace() {
    aws workspaces describe-workspaces | \
        jq '.Workspaces[] | select(.UserName=="josh").WorkspaceId' | \
        xargs -I % aws workspaces start-workspaces --cli-input-json \
            "$(aws workspaces start-workspaces --generate-cli-skeleton  | sed 's/\"\"/\"%\"/')"
    until aws workspaces describe-workspaces | jq '.Workspaces[] | select(.UserName=="josh").State' | grep -m 1 "AVAILABLE"; do : ; done
    aws workspaces describe-workspaces | \
        jq '.Workspaces[] | select(.UserName=="josh").IpAddress' | \
        xargs -I % aws ec2 describe-network-interfaces --filters Name=addresses.private-ip-address,Values=% | \
        jq '.NetworkInterfaces[].Association.PublicIp' | \
        xargs -I {} osascript -e 'tell app "System Events" to display dialog "Workspace launched with IP {}"'
}

cd ~/code/
