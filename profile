
#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc


export VITASDK=/usr/local/vitasdk
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="firefox"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.scripts/DEPLOY"
export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH
export QT_QPA_PLATFORMTHEME="gnome"
