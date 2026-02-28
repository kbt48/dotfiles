# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias cd='cd_ls'
alias cp='cp -i'
alias ls='ls -lX --group-directories-first'
alias ll='ls -AlX --group-directories-first'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'
alias dl='docker ps -l -q'
alias k='kubectl'

# [Prompt]
BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
PURPLE='\[\e[35m\]'
CYAN='\[\e[36m\]'
LIGHT_GRAY='\[\e[37m\]'
DARK_GRAY='\[\e[90m\]'
LIGHT_RED='\[\e[91m\]'
LIGHT_GREEN='\[\e[92m\]'
LIGHT_YELLOW='\[\e[93m\]'
LIGHT_BLUE='\[\e[94m\]'
LIGHT_PURPLE='\[\e[95m\]'
LIGHT_CYAN='\[\e[96m\]'
WHITE='\[\e[97m\]'
RESET='\[\e[0m\]'
# Based Bash Profile Generator
# http://xta.github.io/HalloweenBash/
# 16color
export PS1="$DARK_GRAY[\d \t] $LIGHT_PURPLE\u$LIGHT_BLUE@$GREEN\H\n$RESET $CYAN\w $LIGHT_GRAY\$(parse_git_branch) $LIGHT_BLUE\$ $RESET"

# [History]
# Share bash_history bitween TTY
# http://iandeth.dyndns.org/mt/ian/archives/000651.html
HISTSIZE=10000
HISTFILESIZE=10000
PROMPT_COMMAND='share_history'
shopt -u histappend
# Ignore simple command
HISTIGNORE=ls:ll:history:pwd
# Ignore space, tab, continuous same command
HISTCONTROL=ignoreboth
# Set timestamp
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S  '

function cd_ls {
	\cd $1
	ls -lX --group-directories-first
}

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function share_history {
	history -a
	history -c
	history -r
}

# mise
export PATH="$HOME/.local/share/mise/shims:$PATH"
# sops
export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt

# keychain
if [ -x /usr/bin/keychain ]; then
    eval $(keychain --eval --agents ssh --quiet id_ed25519)
fi
