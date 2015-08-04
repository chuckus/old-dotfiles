# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
DEFAULT_USER='smithr'

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew vi-mode pyenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HOMEBREW_GITHUB_API_TOKEN=d09b97a1338d0f80928ae570976aff1e4bfc1a88

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

source ~/.profile
alias tmux="TERM=screen-256color-bce tmux"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Below is to use auto-change shell color with base16
# if [ -n "$PS1" ]; then # if statement guards adding these helpers for non-interative shells
#     eval "$(~/Work/external/base16-shell/profile_helper.sh)"
# fi

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
