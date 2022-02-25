#!/bin/bash

cd $HOME
sudo apt update

# Install basetools

# Install github-cli


# Install lastpass-cli
sudo apt install lastpass-cli
lpass login $1


# Install chezmoi
bash -c "$(curl -fsLS chezmoi.io/get)"


# Install taskwarrior and timewarrior
sudo apt install taskwarrior timewarrior

# Install cargo install starship --locked