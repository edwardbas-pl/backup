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


alias p="sudo pacman"
alias sv="sudo vim"
alias vi="vim"
alias ka="killall"
alias m="udisksctl mount -b"
alias yt="ytmdl"
alias file=">> list.txt"
alias ech="echo"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias compress='tar -czvf'
alias cp='cp -iv'
