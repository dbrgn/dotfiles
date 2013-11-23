My personal configuration files.

## Setup

    git clone git@github.com:dbrgn/dotfiles.git ~/.dotfiles


## Vim

Contains many tools for Python development.

### Requirements

 * vim compiled with python and ruby support
 * C compiler, ruby and ruby-dev (to build command-t extensions)
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

Update vundle

    vim +BundleInstall! +qall

Configure command-t

    cd ~/.vim/bundle/Command-T/ruby/command-t/
    ruby extconf.rb
    make

Configure YCM

    cd ~/.vim/bundle/YouCompleteMe/
    ./install.sh --clang-completer

Setup gocode

    go get -u github.com/nsf/gocode


## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local


## Systemd Services

    sudo cp services/slock.service /etc/systemd/system/
    sudo cp services/xautolock.service /etc/systemd/system/
    sudo cp services/xmodmap.service /etc/systemd/system/
    sudo cp services/xkbmap-ch.service /etc/systemd/system/
    sudo systemctl enable slock xautolock xmodmap xkbmap-ch
    sudo systemctl start xautolock xmodmap xkbmap-ch

## Other config files

    # screen
    ln -s ~/.dotfiles/.screenrc ~

    # xresources
    ln -s ~/.dotfiles/.Xresources ~

    # xbindkeys
    ln -s ~/.dotfiles/.xbindkeysrc ~

    # xmodmap
    ln -s ~/.dotfiles/.Xmodmap ~
