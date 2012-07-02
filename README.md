My personal configuration files.

## Vim

Contains many tools for Python development.

### Setup

 1. git clone git://github.com/gwrtheyrn/dotfiles.git ~/.dotfiles
 2. ln -s ~/.dotfiles/.vim ~
 3. ln -s ~/.dotfiles/.vimrc ~
 4. cd ~/.vim
 5. git submodule init
 6. git submodule update
 7. git submodule foreach git submodule init
 8. git submodule foreach git submodule update

### Requirements

 * vim compiled with Python and Ruby support
