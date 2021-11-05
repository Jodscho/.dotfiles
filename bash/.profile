# Runs on login.

#[ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/.zshrc ] && source ~/.zshrc

PATH=$PATH":$HOME/Documents/scripts"
#PATH=$PATH":$HOME/Documents/scripts/status"

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export LESSHISTFILE=-

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
