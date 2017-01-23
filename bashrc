# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -2u'
alias vi=$EDITOR
alias dm=docker-machine
alias dc=docker-compose
alias Unity=/opt/Unity/Editor/Unity

# Prompt

# PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
function prompt_command() {
	PS1='\n'
	# PS1+='\[\033[1m\u\]\[\033[36m\[\033[0m@\]\[\033[0m\]\[\033[32m\h\] \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]  '
	PS1+='\[\033[32m\]\u@\h\[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] '
	if ! test -z $CONDA_DEFAULT_ENV
	then
		PS1+='\[\033[1m\]\[\033[31m[conda:$CONDA_DEFAULT_ENV]\]\[\033[0m\] '
	fi
	if ! test -z $DOCKER_MACHINE_NAME
	then
		# PS1+=$(printf "\[\033[33m%*s\r\[\033[0m" $(expr $(tput cols) + 12) "\[\033[36m[$DOCKER_MACHINE_NAME]\]")
		# PS1+='[\[\033[36m$DOCKER_MACHINE_NAME\]\[\033[0m\]]'
		PS1+='\[\033[1m\]\[\033[36m[docker:$DOCKER_MACHINE_NAME]\]\[\033[0m\]'
	fi
	PS1+='\n\[\033[1m\]$\[\033[0m\] '
}
PROMPT_COMMAND=prompt_command

# Functions

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Post fixes

if test -f /etc/bash_completion
then
	source /etc/bash_completion
fi

if ! declare -F __git_ps1 > /dev/null
then
	if test -f /usr/share/git-core/contrib/completion/git-prompt.sh
	then
		source /usr/share/git-core/contrib/completion/git-prompt.sh
	fi
fi
