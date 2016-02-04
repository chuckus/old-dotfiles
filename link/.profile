# $(npm bin -g)
export PATH=$PATH:/usr/local/sbin:/Users/smithr/.node/bin:/usr/local/lib/node_modules/npm/bin/node-gyp-bin:Applications/Xcode.app/Contents/Developer/usr/libexec/git-core/:/usr/bin:/bin:/usr/sbin:/sbin
export WORKON_HOME=$HOME/.virtualenvs

# https://github.com/sstephenson/rbenv#homebrew-on-mac-os-x
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# https://github.com/yyuu/pyenv#homebrew-on-mac-os-x
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Global node modules path
# http://stackoverflow.com/questions/13465829/node-js-modules-path
# Too slow, will just manually set
# export NODE_PATH="'$(npm root -g)'"''

export NODE_PATH=/usr/local/lib/node_modules/
# Should be doing on a case by case basis
# eval "$(docker-machine env default)"

### azure completion - begin. generated by omelette ###
if type compdef &>/dev/null; then
  _azure_complette() {
    compadd -- `azure --compzsh --compgen "${CURRENT}" "${words[CURRENT-1]}" "${BUFFER}"`
  }
  compdef _azure_complette azure
elif type complete &>/dev/null; then
  _azure_complette() {
    COMPREPLY=( $(compgen -W '$(azure --compbash --compgen "${COMP_CWORD}" "${COMP_WORDS[COMP_CWORD-1]}" "${COMP_LINE}")' -- "${COMP_WORDS[COMP_CWORD]}") )
  }
  complete -F _azure_complette azure
fi
### azure completion - end ###

# Allow to install npm packages from location cache - useful if have shit internet
alias npmoffline="npm --cache-min 9999999 "

# Get debug information from the shell
# setopt VERBOSE XTRACE
