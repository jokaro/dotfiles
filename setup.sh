#!/bin/bash

cd $HOME
sudo apt update

# Install basetools
sudo apt install gzip unzip git gcc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

sudo apt install bat ripgrep ncat tig
cargo install exa

# Install lastpass-cli
sudo apt install lastpass-cli
lpass login $1

# Install starship
cargo install starship --locked

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply jokaro
