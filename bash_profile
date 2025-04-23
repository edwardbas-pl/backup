#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc


session=$(tty)
sub='pts'
if [[ "$session" =~ .*"$SUB".* ]]; then
	export GAMESCOPE=0
fi
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	MOZ_ENABLE_WAYLAND=1
fi
#export VITASDK=/usr/local/vitasdk
export LC_ALL="C"
export EDITOR="vim"
export TERMINAL="kitty"
export WINEPREFIX="$HOME/.config/wine"
export BROWSER="firefox"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.scripts/DEPLOY"
export PATH="$PATH:$HOME/.scripts/TRANSCODE"
export PATH="$PATH:$HOME/.scripts/screens"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools/"
export PATH="$PATH:$HOME/Android/Sdk/tools/"
#export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH
export QT_QPA_PLATFORMTHEME="gnome"
export CARGO_HOME="$HOME"/cargo
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export PSQL_HISTORY="$HOME/psql_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MYSQL_HISTFILE="$HOME"/mysql_history
export GTK2_RC_FILES="$HOME/.config"/gtk-2.0/gtkrc
export GRADLE_USER_HOME="$HOME"/gradle
export GNUPGHOME="$HOME"/.gnupg
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTS-8
export ANDROID_HOME="/home/marcin/Android/Sdk"


# Added by Toolbox App
export PATH="$PATH:/home/marcin/.local/share/JetBrains/Toolbox/scripts"

