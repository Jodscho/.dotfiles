[[ $- == *i* ]] && stty -ixon # disable ctrl-s and ctrl-q (for interactive shell)
shopt -s autocd
shopt -s histappend

PATH=~/.scripts:$PATH

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# colored command prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# set xterm title to user@host:dir
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

alias ls='ls -h --color=auto'
alias grep='grep --color=auto'
alias cclip='xclip -selection clipboard'
alias sx-up='kill -s SIGUSR1 $(pgrep sxhkd) && notify-send updated-sxhkd'
alias vim-s='vim  -S ~/mysession.vim -c '\''hi TabLineSel ctermfg=White ctermbg=Grey
'\'''
