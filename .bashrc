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

# [Prompt]
BLACK='\[\e[30;40m\]'
RED='\[\e[31;40m\]'
GREEN='\[\e[32;40m\]'
YELLOW='\[\e[33;40m\]'
BLUE='\[\e[34;40m\]'
PURPLE='\[\e[35;40m\]'
CYAN='\[\e[36;40m\]'
LIGHT_GLAY='\[\e[37;40m\]'
DARK_GLAY='\[\e[90;40m\]'
LIGHT_RED='\[\e[91;40m\]'
LIGHT_GREEN='\[\e[92;40m\]'
LIGHT_YELLOW='\[\e[93;40m\]'
LIGHT_BLUE='\[\e[94;40m\]'
LIGHT_PURPLE='\[\e[95;40m\]'
LIGHT_CYAN='\[\e[96;40m\]'
WHITE='\[\e[97;40m\]'
RESET='\[\e[0m\]'
# Based Bash Profile Generator
# http://xta.github.io/HalloweenBash/
# 16color
export PS1="$DARK_GLAY[\d \t] $LIGHT_PURPLE\u$LIGHT_BLUE@$GREEN\H\n$RESET $CYAN\w $LIGHT_GLAY\$(parse_git_branch) $LIGHT_BLUE\$ $RESET"

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

export PATH="$HOME/.local/share/mise/shims:$PATH"
