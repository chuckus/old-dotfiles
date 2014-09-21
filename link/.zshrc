export PATH=~/.dotfiles/bin:$PATH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/libs/oh-my-zsh

# Set name of the theme to load.
DEFAULT_USER='marcus'
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmuxinator rails osx git-hubflow github gem bundler brew cpanm nvm postgres rake rvm tmux ssh-agent vundle vi-mode)

source $ZSH/oh-my-zsh.sh

# ssh agent config

zstyle :omz:plugins:ssh-agent agent-forwarding on

bindkey -v
bindkey -M vicmd "/" history-incremental-search-backward
bindkey '^R' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char



# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if (( $# == 0 )); then
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  else
    source "$HOME/.dotfiles/source/$1.sh"
  fi
}

#[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh


# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias mate=vim
alias dokku="ssh stagolee dokku"
#export DOCKER_HOST=tcp://localhost:4243
export DOCKER_HOST=tcp://192.168.59.103:2375
export GOPATH=/Users/marcus/gocode
export GOROOT=/usr/local/Cellar/go/1.3.1/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

