#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\W\[\e[91m\]\$(parse_git_branch)\[\e[00m\]> "


pfetch


if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

extract () {
    if [ ! -f "$1" ] ; then
        echo "'$1' does not exist."
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar -xvjf "$1"   ;;
        *.tar.xz)    tar -xvJf "$1"   ;;
        *.tar.gz)    tar -xvzf "$1"   ;;
        *.bz2)       bunzip2 "$1"    ;;
        *.rar)       rar x "$1"      ;;
        *.gz)        gunzip "$1"     ;;
        *.tar)       tar xvf "$1"    ;;
        *.tbz2)      tar xvjf "$1"   ;;
        *.tgz)       tar xvzf "$1"   ;;
        *.zip)       unzip '$1'      ;;
        *.Z)         uncompress "$1" ;;
        *.xz)        xz -d "$1"      ;;
        *.7z)        7z x "$1"       ;;
        *.a)         ar x "$1"       ;;
        *)           echo "Unable to extract '$1'." ;;
    esac
}

2clip (){
	xclip -sel clip $1
}


session=$(tty)
sub='pts'
if [[ "$session" =~ .*"$SUB".* ]]; then
	export GAMESCOPE=0
fi

shopt -s autocd
shopt -s cdspell
alias ..="cd .."
alias vi="vim"
alias compress='tar -czvf'
alias cp='cp -iv'
alias ll="ls -l"
alias la="ls -la"
alias grep='grep --color=auto'
alias Games="/media/HDD/Games"
alias Video="/media/HDD/Video"
alias SSD="/media/SSD"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias dmenu='dmenu -h 25 -l 20 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

export VISUAL="nvim"
export EDITOR="nvim"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
alias vim="nvim"
export PATH="/home/marcin/.local/bin:$PATH"
