My personal configuration files.


## Setup

    git clone git@github.com:dbrgn/dotfiles.git ~/.dotfiles


## NeoVim

Install dependencies:

    sudo pacman -S python-pynvim bash-language-server shellcheck

Prepare directories:

    mkdir -p ~/.local/share/nvim/site/autoload/ ~/.config/nvim/

Symlink configs:

    ln -s ~/.dotfiles/nvim.init.vim ~/.config/nvim/init.vim

Download vim-plug:

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Install plugins:

    nvim +PlugInstall


## Vim

Contains many tools for Python development.

### Requirements

 * vim compiled with python support
 * C compiler
 * C++ compiler and python headers

### Setup

Create symlinks

    ln -s ~/.dotfiles/.vim ~
    ln -s ~/.dotfiles/.vimrc ~

Copy and install powerline fonts

    mkdir -p ~/.fonts/{truetype,opentype}/
    cp ~/.dotfiles/fonts/*.ttf ~/.fonts/truetype/
    cp ~/.dotfiles/fonts/*.otf ~/.fonts/opentype/
    fc-cache -fv ~/.fonts

Configure fontconfig:

    mkdir -p ~/.config/fontconfig/
    ln -s ~/.dotfiles/fonts.conf ~/.config/fontconfig/

Setup vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
    vim +VimProcInstall

Install vimproc

    vim +VimProcInstall +qall

Configure YCM

    cd ~/.vim/bundle/YouCompleteMe/
    git submodule update --init --recursive
    python install.py --rust-completer --ts-completer

Update vundle

    vim +BundleInstall! +qall

Setup gocode

    go get -u github.com/nsf/gocode

Install dependencies for ale

    sudo pacman -S flake8 mypy


## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local


## Window Manager

Symlink config files:

    ln -s ~/.dotfiles/.xprofile ~
    ln -s ~/.dotfiles/.xsetroot.sh ~


## Systemd Services

    sudo cp services/slock.service /etc/systemd/system/
    sudo cp services/xmodmap.service /etc/systemd/system/
    sudo cp services/xkbmap-ch.service /etc/systemd/system/
    sudo systemctl enable slock xmodmap xkbmap-ch
    sudo systemctl start xidlelock xmodmap xkbmap-ch


## SSH Agent

    mkdir -p ~/.config/systemd/user/
    cp services/ssh-agent.service ~/.config/systemd/user/
    systemctl --user start ssh-agent
    systemctl --user enable ssh-agent


## Sway

    sudo pacman -S sway mako swaylock waybar bemenu bemenu-wayland noto-fonts \
        noto-fonts-extra ttf-font-awesome playerctl pacman-contrib jq grim slurp \
        swayidle brightnessctl wl-clipboard
    yay -S j4-dmenu-desktop wofi-emoji
    ln -s ~/.dotfiles/config/sway ~/.config/sway
    ln -s ~/.dotfiles/config/mako ~/.config/mako
    ln -s ~/.dotfiles/config/swaylock ~/.config/swaylock
    ln -s ~/.dotfiles/config/waybar ~/.config/waybar
    ln -s ~/.dotfiles/config/xdg-desktop-portal-wlr/ ~/.config/xdg-desktop-portal-wlr


## Other config files

    # screen
    ln -s ~/.dotfiles/.screenrc ~

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

    # git
    ln -s ~/.dotfiles/git ~/.config/git

    # flake8
    ln -s ~/.dotfiles/config/flake8 ~/.config/flake8

    # ipython
    ln -s ~/.dotfiles/ipython_config.py ~/.ipython/profile_default/

    # calf
    ln -s ~/.dotfiles/calf.conf ~/calf.conf

    # alacritty.yml (hardlink for change detection)
    ln ~/.dotfiles/alacritty.yml ~/.config/alacritty/

    # abcde
    ln -s ~/.dotfiles/.abcde.conf ~/.abcde.conf
