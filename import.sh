#!/bin/sh

sudo apt update

# install tools
sudo apt install git zsh tilix -y

# clone settings repo
git clone git@github.com:langtu/ubuntu-settings.git
cd ubuntu-settings

# install fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
sudo cp *.ttf /usr/share/fonts/truetype/

# restore gnome settings
dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf
dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' < custom-keybindings.dconf

# restore tilix settings
dconf load /com/gexperts/Tilix/ < tilix.dconf

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# restore zsh config
cp .zshrc ~/
cp .p10k.zsh ~/

# reload zsh
source ~/.zshrc

# clean up
cd ..
rm -rf ubuntu-settings