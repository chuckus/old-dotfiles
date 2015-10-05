# $(npm bin -g)
export PATH=$PATH:/usr/local/sbin:/Users/smithr/.node/bin:/usr/local/lib/node_modules/npm/bin/node-gyp-bin:Applications/Xcode.app/Contents/Developer/usr/libexec/git-core/:/usr/bin:/bin:/usr/sbin:/sbin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

# https://github.com/sstephenson/rbenv#homebrew-on-mac-os-x
eval "$(rbenv init -)"
# https://github.com/yyuu/pyenv#homebrew-on-mac-os-x
eval "$(pyenv init -)"

# Global node modules path
# http://stackoverflow.com/questions/13465829/node-js-modules-path
export NODE_PATH="'$(npm root -g)'"''

# http://virtualenvwrapper.readthedocs.org/en/latest/install.html#shell-startup-file
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

# Kordia gerrit
alias gerrit='ssh -p 29418 git.mgnt gerrit'
