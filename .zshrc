# Inspired by: https://github.com/mcornella/dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.zsh/ohmyzsh"
ZSH_CUSTOM="$HOME/.zsh/ohmyzsh-custom"

# Uncomment this to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't resolve symbolic links in z
#_Z_NO_RESOLVE_SYMLINKS="true"

# Colorize settings
#ZSH_COLORIZE_TOOL=chroma
# Nice ones: arduino friendly paraiso-dark solarized-dark solarized-dark256 vim
#ZSH_COLORIZE_STYLE=vim

# Which plugins would you like to load?
plugins=(
	git
	git-extras
	github
	gitignore
	z
	dircycle
	web-search
	sudo
	zsh_reload
	extract
	history-substring-search
	npm
	docker-compose
	colorize
	colored-man-pages
	# custom plugins go here
	git-prompt
	k
)

# Don't load Oh My Zsh on TTYs
#[[ $TTY != /dev/tty* ]] && source "$ZSH/oh-my-zsh.sh"

## User configuration

# complete . and .. directories
zstyle ':completion:*' special-dirs true

# paginated completion
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''

# Docker completion option stacking
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# correction of commands
setopt correct

# extended globbing (adds ^ and other symbols as wildcards)
setopt extended_glob

# zmv
autoload zmv
alias mmv='noglob zmv -W'



## Alias

alias ohmyzsh='vsc "$ZSH"'
alias zshrc='vsc ~/.zshrc'

## Key bindings

# CTRL + U more accessible Undo
bindkey '^U' undo
# CTRL + K deletes whole line
bindkey '^K' kill-buffer
# ALT + DEL deletes whole forward-word
bindkey '^[[3;3~' kill-word
# CTRL + DEL deletes whole forward-word
bindkey '^[[3;5~' kill-word
# CTRL + BACKSPACE deletes whole backward-word
bindkey '^H' backward-kill-word
# ALT + L lowercases word
bindkey '^[l' down-case-word

## Sourcing external files

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# custom aliases
[[ -f ~/.zsh/aliases ]] && . ~/.zsh/aliases

# custom functions
[[ -f ~/.zsh/functions ]] && . ~/.zsh/functions
