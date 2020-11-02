# Git Bare Dotfiles

(https://www.atlassian.com/git/tutorials/dotfiles)

(https://bitbucket.org/durdn/cfg/src/master/)

```bash
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' (add this alias to .bashrc)
bash
config config --local status.showUntrackedFiles no

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Basic usage example:

```bash
config add /path/to/file
config commit -m "A short message"
config push
```

## New machine

Bootstrap script: (https://github.com/jokaro/dotfiles/raw/master/.bin/install.sh)

```bash
curl -Lks https://github.com/jokaro/dotfiles/raw/master/.bin/install.sh | /bin/bash
```

```bash
echo ".cfg" >> .gitignore
git clone --bare git@github.com:jokaro/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

## Inspiration

https://dotfiles.github.io/inspiration/

https://github.com/holman/dotfiles

https://github.com/statico/dotfiles
https://statico.github.io/vim3.html

## Alternative
https://github.com/dotphiles/dotphiles

https://github.com/dotphiles/dotsync

## For windows

https://github.com/valleyjo/win.files

https://github.com/Jeff-Tian/win.files
