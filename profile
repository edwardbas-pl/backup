
#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc


session=$(tty)
sub='pts'
if [[ "$session" =~ .*"$SUB".* ]]; then
	export GAMESCOPE=0
fi
export VITASDK=/usr/local/vitasdk
export EDITOR="vim"
export TERMINAL="kitty"
export WINEPREFIX="$HOME/.config/wine"
export BROWSER="firefox"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.scripts/DEPLOY"
export PATH="$PATH:$HOME/.scripts/TRANSCODE"
export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH
export QT_QPA_PLATFORMTHEME="gnome"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config

