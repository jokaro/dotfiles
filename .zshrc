# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use antigen
source $HOME/.zsh/antigen.zsh

# Use Oh-My-Zsh
antigen use oh-my-zsh

# Set theme
antigen theme bira

# Set plugins (plugins not part of Oh-My-Zsh can be installed using githubusername/repo)
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Apply changes
antigen apply

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
