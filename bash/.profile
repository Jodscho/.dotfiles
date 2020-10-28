# Runs on login.

[ -f ~/.bashrc ] && source ~/.bashrc

PATH=$PATH":$HOME/scripts"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
