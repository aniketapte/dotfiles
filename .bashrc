# don't put dup lines or lines starting with space in history.
HISTCONTROL=ignoreboth

# append to history file rather than overwrite
shopt -s histappend

# Max number of lines to store in history
HISTFILESIZE=10000

# check window size after each command, update LINES & COLUMNS if required
shopt -s checkwinsize

# enable color support for ls and other commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color'
    alias fgrep='fgrep --color'
    alias egrep='egrep --color'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable command completion, if available
if ! shopt -oq posix; then
    if [ -f /usr/share//bash-completion/bash_completion ]; then
        . /usr/share//bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -i '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias l='ls -Al'
export PS1="\[\e[0;36m\][\u@\h \w \$(parse_git_branch)] \[\e[m\]"
export EDITOR=vim

export CLICOLOR=1
