My personal configuration files.

## Setup

 1. git clone git://github.com/gwrtheyrn/dotfiles.git ~/.dotfiles
 1. git submodule init
 1. git submodule update
 1. git submodule foreach git submodule init
 1. git submodule foreach git submodule update

## Vim

Contains many tools for Python development.

### Setup

Create symlinks

 * ln -s ~/.dotfiles/.vim ~
 * ln -s ~/.dotfiles/.vimrc ~

Setup vundle

 * git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
 * vim +BundleInstall +qall

Configure command-t

 * cd ~/.vim/bundle/Command-T/ruby/command-t/
 * ruby extconf.rb
 * make

### Requirements

 * vim compiled with Python and Ruby support
 * C compiler (to build command-t extensions)

## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local

## Screen

 1. ln -s ~/.dotfiles/.screenrc ~
