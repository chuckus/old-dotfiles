export PATH=~/.dotfiles/bin:$PATH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/libs/oh-my-zsh

# Set name of the theme to load.
DEFAULT_USER='csmith'
ZSH_THEME="pygmalion"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vundle vi-mode)

source $ZSH/oh-my-zsh.sh

# ssh agent config

zstyle :omz:plugins:ssh-agent agent-forwarding on

# TODO: someone else config, might be vim related or efficient, look at some day
# bindkey -v
# bindkey -M vicmd "/" history-incremental-search-backward
# bindkey '^R' history-incremental-search-backward
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M viins 'kj' vi-cmd-mode


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

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper
workon develop27

export HTTP_PROXY=http://proxy.wno.mgnt:3128
export http_proxy=http://proxy.wno.mgnt:3128
export HTTPS_PROXY=http://proxy.wno.mgnt:3128
export https_proxy=http://proxy.wno.mgnt:3128

alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'
eval `dircolors ~/.dir_colors/dircolors.256dark`
