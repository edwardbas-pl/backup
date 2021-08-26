#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\W> "

setxkbmap pl

pfetch | lolcat


if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

extract () {
    if [ ! -f "$1" ] ; then
        echo "'$1' does not exist."
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar xvjf "$1"   ;;
        *.tar.xz)    tar xvJf "$1"   ;;
        *.tar.gz)    tar xvzf "$1"   ;;
        *.bz2)       bunzip2 "$1"    ;;
        *.rar)       rar x "$1"      ;;
        *.gz)        gunzip "$1"     ;;
        *.tar)       tar xvf "$1"    ;;
        *.tbz2)      tar xvjf "$1"   ;;
        *.tgz)       tar xvzf "$1"   ;;
        *.zip)       unzip "$1"      ;;
        *.Z)         uncompress "$1" ;;
        *.xz)        xz -d "$1"      ;;
        *.7z)        7z x "$1"       ;;
        *.a)         ar x "$1"       ;;
        *)           echo "Unable to extract '$1'." ;;
    esac
}


shopt -s autocd
shopt -s cdspell
alias ..="cd .."
alias vi="vim"
alias ka="killall"
alias compress='tar -czvf'
alias cp='cp -iv'
alias grep='grep --color=auto'

alias dmenu='dmenu -h 25 -l 20 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
