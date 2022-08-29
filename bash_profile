
#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc



export VITASDK=/usr/local/vitasdk
export VISUAL="nvim"
export EDITOR="nvim"
export WINEPREFIX="$HOME/.config/wine"
export TERMINAL="kitty"
export BROWSER="firefox"
export PATH="$PATH:$HOME/.scripts"
export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH
