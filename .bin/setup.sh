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
sudo apt update
sudo apt upgrade

echo "============================================="
if grep "microsoft" /proc/sys/kernel/osrelease; then
    echo "WSL Environment"
    echo "We can not use snapd"
else
    echo "Native linux Environment"
    echo "We can use snapd"
    usesnap=1
fi

if [[ -v usesnap ]]; then
    echo "Installing snapd..."
    sudo apt install snapd
fi

echo "============================================="
echo "Installing python and pip..."
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

echo "Installing node..."
if [[ -v usesnap ]]; then
    sudo snap install node --classic
else
    sudo apt install -y nodejs
fi

#@TODO install our custom fonts and stuff

echo "Installing tmux..."
sudo apt install -y tmux

echo "Installing NeoVim..."
if [[ -v usesnap ]]; then
    sudo snap install nvim --beta --classic
else
    sudo apt install neovim
fi

sudo update-alternatives --install /usr/bin/vi vi $(which nvim) 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim $(which nvim) 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 60
sudo update-alternatives --config editor

echo "Installing Zsh..."
sudo apt install -y zsh zsh-doc

echo "============================================="
echo "Grunting it up"
sudo npm install -g grunt-cli

echo "============================================="
if [[ -v usesnap ]]; then
    echo "Installing Go with snap..."
    sudo snap install go --classic
else
    echo "Installing Go..."
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install golang-go
fi

echo "Installing Go tools..."
go get -u github.com/alecthomas/chroma/cmd/chroma

echo "Installing python tools..."
sudo pip3 install Pygments

echo "Setting ZSH as shell..."
chsh -s $(which zsh)

echo "Done!"
