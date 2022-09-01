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
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
	printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
	printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
	printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
	printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
	printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
	printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
	printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
	printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
	printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
	printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
	printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
	printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
	printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
	printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
	printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
	printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
else
	alias vim="nvim"
fi
