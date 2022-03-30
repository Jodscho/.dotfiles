autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="%B%{$fg[red]%}%{$fg[magenta]%}%~%{$fg[red]%}%{$reset_color%} %b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9000
SAVEHIST=9000
setopt autocd extendedglob nomatch
unsetopt beep
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
	 echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
	 echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.




bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jonathan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#	RPS2=$RPS1
#	zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select


alias ls='ls -h --color=auto'
alias grep='grep --color=auto'
alias cclip='xclip -selection clipboard'
alias vim-s='vim -S /home/jonathan/.config/vim-sessions/"$(ls /home/jonathan/.config/vim-sessions/ | dmenu -p 'choose' -i -l 5)" -c "source /home/jonathan/.vimrc"'
alias pdftab='zathura $(find . -maxdepth 1 -type f -name "*.pdf*" ) -e $(xdotool search --class tabbed || tabbed -c -d )'
alias zattab='tabbed -c zathura -e & disown'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
