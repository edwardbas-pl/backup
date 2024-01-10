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
        *.zip)       unzip "$1"      ;;
        *.Z)         uncompress "$1" ;;
        *.xz)        xz -d "$1"      ;;
        *.7z)        7z x "$1"       ;;
        *.a)         ar x "$1"       ;;
        *)           echo "Unable to extract '$1'." ;;
    esac
}

find_and_copy (){
    # echo $2
    find . -iname "$1" -print0 | xargs -0 -I {} cp {} "$2"
    # find $PWD -iname "'$1'" -exec  cp {} '$2'\;"
}

detach () {
    nohup $1 > /dev/null 2> /dev/null && notify-send "done $1"
}

2clip (){
	xclip -sel clip $1
}

function subs() {
    movie="${1}"
    filename="${1%.*}"
    mappings=`ffprobe -loglevel error -select_streams s -show_entries stream=index:stream_tags=language -of csv=p=0 "${movie}"`
    OLDIFS=$IFS
    IFS=,
    ( while read idx lang
    do
        echo "Exctracting ${lang} subtitle #${idx} from ${movie}"
        ffmpeg -nostdin -hide_banner -loglevel quiet -i "${movie}" -map 0:"$idx" "${filename}.${lang}.srt"
    done <<< "${mappings}" )
    IFS=$OLDIFS
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
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
# alias dmenu='dmenu -h 25 -l 20 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
export VISUAL="nvim"
export EDITOR="nvim"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
alias vim="nvim"
export PATH="/home/marcin/.local/bin:$PATH"
