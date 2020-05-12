#!/bin/sh

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "Creating an SSH key for you..."
    ssh-keygen -t rsa
else
    echo "Displaying public key..."
    cat ~/.ssh/id_rsa.pub
fi

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "============================================="
echo "Install python and pip"
sudo apt install -y python python-pip python3 python3-pip

echo "============================================="
echo "Installing Git..."
sudo apt install -y git

echo "Git config"
echo "============================================="
echo "Default email to use for git?"
read gitemail

git config --global user.name "Joakim Karlsson"
git config --global user.email $gitemail

echo "============================================="
echo "Installing git utilities..."
sudo apt install -y git-extras
#sudo apt install -y legit
#sudo apt install -y git-flow

echo "Installing other stuff..."
sudo apt install -y tig
sudo apt install -y tree
sudo apt install -y wget
sudo apt install -y cowsay
sudo apt install -y lolcat
sudo apt install -y silversearcher-ag
sudo apt install -y gist
sudo apt install -y shellcheck

echo "Installing node"
sudo apt install -y nodejs

#@TODO install our custom fonts and stuff

echo "Install tmux"
sudo apt install -y tmux

echo "Install Zsh"
sudo apt install -y zsh zsh-doc

echo "============================================="
echo "Grunting it up"
sudo npm install -g grunt-cli

echo "Setting ZSH as shell..."
chsh -s $(which zsh)

echo "Done!"
