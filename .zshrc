# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/grant/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# My Aliases
alias cdr='cd ~/Repos'
alias cdb='cd ~/go/src/git.nav.com/backend/'
alias gob='go build'
alias gogu='go get -u'
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gr='git rebase'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gce='git commit --allow-empty -m "Forcing new pipeline $(date +%s)" && git push'
alias gcw='git commit -m "wip"'
alias gct='git checkout'
alias gctb='git checkout -b'
alias gf='git fetch'
alias pg='pgcli postgres'
alias postgrescli='psql'
alias keebg='code /Users/grant/Repos/qmk_firmware/keyboards/keebio/quefrency/keymaps/grant_q65/keymap.c'
alias mkeebg='cd /Users/grant/Repos/qmk_firmware && make keebio/quefrency:grant_q65:avrdude'

alias google='googler --count 5'
chrome() {
 /usr/bin/open -a "/Applications/Google Chrome.app" http://"$1"
}

lh() {
 /usr/bin/open -a "/Applications/Google Chrome.app" http://localhost:"$1"
}

alias kuc='kubectl config use-context '
alias kge='kubectl get endpoints '
kc() {
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
  echo $(kc)
  echo "Using pod: $podName"
  kubectl port-forward $podName $port
}
kb() {
  echo "Executing K8s shell"
  svcName="$1"
  podName=$(kfirstpod $svcName)
  echo $(kc)
  echo "Using pod: $podName"
 kubectl exec -it $podName bash
}
kbe() {
  echo "Executing Command on K8s shell: $2 $3 $4 $5 $6 $7 $8" 
  svcName="$1"
  podName=$(kfirstpod $svcName)
  echo $(kc)
  echo "Using pod: $podName"
 kubectl exec $podName $2 $3 $4 $5 $6 $7 $8
}
kdp() {
  svcName="$1"
  podName=$(kfirstpod $svcName)
  kubectl describe pod $podName
}

# go setup added Feb 9, 2019
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:/Users/grant/go/bin/
export GOBIN=/Users/grant/go/bin/
export GO111MODULE=auto
export GOPRIVATE="*.nav.com"


# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add ~/bin to path
export PATH=$PATH:~/bin

# RUBY
PATH="$HOME/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
eval "$(rbenv init -)"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
