#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\W> "

setxkbmap pl

pfetch



if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

shopt -s autocd
alias ..="cd .."
alias vi="vim"
alias ka="killall"
alias compress='tar -czvf'
alias cp='cp -iv'
