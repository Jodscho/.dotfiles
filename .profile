# Runs on login.

[ -f ~/.bashrc ] && source ~/.bashrc

sxhkd -c ~/sxhkdrc &
redshift -c ~/redshift &

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
