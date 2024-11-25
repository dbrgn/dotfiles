My personal configuration files.


## Setup

    git clone git@github.com:dbrgn/dotfiles.git ~/.dotfiles


## Fonts

Copy and install powerline fonts

    mkdir -p ~/.fonts/{truetype,opentype}/
    cp ~/.dotfiles/fonts/*.ttf ~/.fonts/truetype/
    cp ~/.dotfiles/fonts/*.otf ~/.fonts/opentype/
    fc-cache -fv ~/.fonts

Configure fontconfig:

    mkdir -p ~/.config/fontconfig/
    ln -s ~/.dotfiles/fonts.conf ~/.config/fontconfig/


## NeoVim

Install dependencies:

    sudo pacman -S python-pynvim bash-language-server python-lsp-server shellcheck

Prepare directories:

    mkdir -p ~/.local/share/nvim/site/autoload/ ~/.config/nvim/

Symlink configs:

    ln -s ~/.dotfiles/nvim.init.vim ~/.config/nvim/init.vim

Download vim-plug:

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Install plugins:

    nvim +PlugInstall


## Bash

To use `.bashrc.local`, source it in your regular `.bashrc`:

    source ~/.dotfiles/.bashrc.local


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
    ln -s ~/.dotfiles/config/xdg-desktop-portal/ ~/.config/xdg-desktop-portal
    ln -s ~/.dotfiles/config/xdg-desktop-portal-wlr/ ~/.config/xdg-desktop-portal-wlr
    sudo mv /usr/share/wayland-sessions/sway.desktop{,.old}
    sudo ln -s ~/.dotfiles/startsway.sh /usr/local/bin/
    sudo ln -s ~/.dotfiles/sway.desktop /usr/share/wayland-sessions/


## Other config files

    # screen
    ln -s ~/.dotfiles/.screenrc ~

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

    # alacritty
    echo '[general]' > ~/.config/alacritty/alacritty.toml
    echo 'import = ["~/.dotfiles/config/alacritty/alacritty.toml"]' >> ~/.config/alacritty/alacritty.toml

    # abcde
    ln -s ~/.dotfiles/.abcde.conf ~/.abcde.conf

    # gpg
    ln -s ~/.dotfiles/gpg.conf ~/.gnupg/gpg.conf

    # chromium
    ln -s ~/.dotfiles/chromium-flags.conf ~/.config/chromium-flags.conf

    # VS Code
    ln -s ~/.dotfiles/vscode.settings.json ~/.config/Code/User/settings.json
