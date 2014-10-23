dotvim
======

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim

git submodule init

git submodule update

cd ~/.vim/bundle/Command-T/ruby/command-t

On Ubuntu, sudo apt-get install ruby1.9.1-dev

ruby extconf.rb

make

