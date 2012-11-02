My personal configuration files.

## Setup

    git clone git@github.com:gwrtheyrn/dotfiles.git ~/.dotfiles


## Vim

Contains many tools for Python development.

### Requirements

 * vim compiled with Python and Ruby support
 * C compiler and Ruby (to build command-t extensions)

### Setup

Create symlinks

    ln -s ~/.dotfiles/.vim ~
    ln -s ~/.dotfiles/.vimrc ~

Setup vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

Configure command-t

    cd ~/.vim/bundle/Command-T/ruby/command-t/
    ruby extconf.rb
    make


## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local


## Screen

    ln -s ~/.dotfiles/.screenrc ~
