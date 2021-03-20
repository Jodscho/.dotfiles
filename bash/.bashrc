[[ $- == *i* ]] && stty -ixon # disable ctrl-s and ctrl-q (for interactive shell)
shopt -s autocd
shopt -s histappend
xset b off
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

#PATH=~/scripts:$PATH

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

# colored command prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00;37m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='\[\033[01;34m\]\u\[\033[01;31m\]@\033[01;32m\]\h\[\033[00;37m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033[01;34m\]\u\[\033[01;31m\]@\h\[\033[00;31m\]:\[\033[01;32m\]\w\[\033[00m\]\$ '

# set xterm title to user@host:dir
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

alias ls='ls -h --color=auto'
alias grep='grep --color=auto'
alias cclip='xclip -selection clipboard'
alias vim-s='vim -S ~/vim-sessions/"$(ls ~/vim-sessions | dmenu -p 'choose' -i -l 5)" -c "source ~/.vimrc"'
