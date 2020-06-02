stty -ixon # disable ctrl-s and ctrl-q
shopt -s autocd
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# colored command prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# set xterm title to user@host:dir
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
