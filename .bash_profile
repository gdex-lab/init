#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/Users/grant/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-plain'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# My Aliases
alias cdr='cd ~/Repos'
alias cdb='cd ~/go/src/git.nav.com/backend/'

alias gob='go build'
alias gogu='go get -u'

alias gph='git push'
alias gpl='git pull'
alias gr='git rebase'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m'
alias gct='git checkout'
alias gctb='git checkout -b'
alias gf='git fetch'
alias psql='pgcli'

alias google='googler --count 5'
chrome() {
 /usr/bin/open -a "/Applications/Google Chrome.app" http://"$1"
}

lh() {
 /usr/bin/open -a "/Applications/Google Chrome.app" http://localhost:"$1"
}

alias kuc='kubectl config use-context '
alias kge='kubectl get endpoints '
k() {
  echo "Using Context: $(kubectl config current-context)" 
}
kfirstpod() {
  kubectl get pods | grep "$1" | sed 1q | awk '{print $1;}'
}
kgp() {
  kubectl get pods | grep "$1"
}
kpf() {
  echo "Port forwarding K8s service"
  svcName="$1"
  port="$2"
  podName=$(kfirstpod $svcName)
  echo $(k)
  echo "Using pod: $podName"
  kubectl port-forward $podName $port
}
kb() {
  echo "Executing K8s shell"
  svcName="$1"
  podName=$(kfirstpod $svcName)
  echo $(k)
  echo "Using pod: $podName"
 kubectl exec -it $podName bash
}
kbe() {
  echo "Executing Command on K8s shell: $2 $3 $4 $5 $6 $7 $8" 
  svcName="$1"
  podName=$(kfirstpod $svcName)
  echo $(k)
  echo "Using pod: $podName"
 kubectl exec $podName $2 $3 $4 $5 $6 $7 $8
}

# pyenv config added by Bi Transform /Users/grant/Repos/transform/bin/bootstrap.sh on Mon Feb  4 15:28:46 MST 2019
export PYENV_ROOT="/Users/grant/.pyenv"
export PATH="/Users/grant/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# go setup added Feb 9, 2019
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:/Users/grant/go/bin/
export GOBIN=/Users/grant/go/bin/


# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add ~/bin to path
export PATH=$PATH:~/bin


# RUBY
PATH="$HOME/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
eval "$(rbenv init -)"
