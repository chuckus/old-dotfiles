# load zgen
source "${HOME}/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # save all to init script
    zgen save
fi

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
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
