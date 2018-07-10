My personal configuration files.

## Setup

    git clone git@github.com:dbrgn/dotfiles.git ~/.dotfiles


## Vim

Contains many tools for Python development.

### Requirements

 * vim compiled with python support
 * C compiler
 * C++ compiler and python headers
 * Jedi (https://github.com/davidhalter/jedi)

### Setup

Create symlinks

    ln -s ~/.dotfiles/.vim ~
    ln -s ~/.dotfiles/.vimrc ~

Copy and install powerline fonts

    mkdir -p ~/.fonts/truetype/
    cp ~/.dotfiles/fonts/*.ttf ~/.fonts/truetype/
    fc-cache -fv ~/.fonts

Setup vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
    vim +VimProcInstall

Configure YCM

    cd ~/.vim/bundle/YouCompleteMe/
    git submodule update --init --recursive
    python2 install.py --racer-completer

Update vundle

    vim +BundleInstall! +qall

Setup gocode

    go get -u github.com/nsf/gocode


## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local


## Systemd Services

    sudo cp services/slock.service /etc/systemd/system/
    sudo cp services/xidlehook.service /etc/systemd/system/
    sudo cp services/xmodmap.service /etc/systemd/system/
    sudo cp services/xkbmap-ch.service /etc/systemd/system/
    sudo systemctl enable slock xidlehook xmodmap xkbmap-ch
    sudo systemctl start xidlehook xmodmap xkbmap-ch

## Other config files

    # screen
    ln -s ~/.dotfiles/.screenrc ~

    # ack
    ln -s ~/.dotfiles/.ackrc ~

    # xresources
    ln -s ~/.dotfiles/.Xresources ~

    # xbindkeys
    ln -s ~/.dotfiles/.xbindkeysrc ~

    # xmodmap
    ln -s ~/.dotfiles/.Xmodmap ~

    # psql
    ln -s ~/.dotfiles/.psqlrc ~

    # gtk 2 theme
    ln -s ~/.dotfiles/.gtkrc-2.0 ~

    # gitconfig
    ln -s ~/.dotfiles/.gitconfig ~

    # flake8
    ln -s ~/.dotfiles/flake8 ~/.config/flake8

    # ipython
    ln -s ~/.dotfiles/ipython_config.py ~/.ipython/profile_default/

    # calf
    ln -s ~/.dotfiles/calf.conf ~/calf.conf
