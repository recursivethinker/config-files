#!/bin/bash

echo 'Enter your sudo password'

# Prompt for sudo privileges.
sudo -v || { echo 'Authentication failed.'; exit 1; }

echo
echo 'Updating and Upgrading the system.'
echo
echo

sudo apt update && sudo apt -y upgrade

echo
echo 'Installing the essentials.'
echo
echo

sudo apt install htop neofetch git curl tmux vim taskwarrior lm-sensors \
network-manager cmatrix

echo
echo 'Installing FZF.'
echo
echo

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo
echo 'Installing ripgrep'
echo
echo

sudo apt install ripgrep


echo
echo 'Installing vim-plug'


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo
echo 'Installing vundle'

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo
echo 'Tmux Plugin Manager'

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo
echo 'Get config files'
wget https://raw.githubusercontent.com/recursivethinker/config-files/main/vim/.vimrc\
	-O ~/.vimrc

wget\
https://raw.githubusercontent.com/recursivethinker/config-files/main/tmux/.tmux.conf\
	-O ~/.tmux.conf

echo
echo 'Install docker'

# uninstall conflicting packages.
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker packages.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo 'run `sudo docker run hello-world` to test your installation.'
