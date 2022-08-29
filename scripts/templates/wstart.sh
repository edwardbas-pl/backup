#!/bin/bash
cd "$(dirname "$0")" || exit; [ "$EUID" = "0" ] && exit; RUMTRICKS="$PWD/files/rumtricks.sh"; [ ! -x "$RUMTRICKS" ] && cp /usr/bin/rumtricks "$RUMTRICKS"; export WINEPREFIX="$PWD/files/prefix"; export STAGING_SHARED_MEMORY=1; export WINE_LARGE_ADDRESS_AWARE=1; : ${GAMESCOPE:=$(command -v gamescope)}; RRES=$(command -v rres); set -euo pipefail; echo -e "\e[38;5;38m" && cat << 'EOF'
    ___  ________     _____  ___   ___    _____
   |\  \|\   ____\   / __  \|\  \ |\  \  / __  \
   \ \  \ \  \___|  |\/_|\  \ \  \\_\  \|\/_|\  \
 __ \ \  \ \  \     \|/ \ \  \ \______  \|/ \ \  \
|\  \\_\  \ \  \____     \ \  \|_____|\  \   \ \  \
\ \________\ \_______\    \ \__\     \ \__\   \ \__\
 \|________|\|_______|     \|__|      \|__|    \|__|
  Pain heals, Chicks dig scars, Glory lasts forever!
     Hacker group on 1337x.to and rumpowered.org
EOF
echo -e "\e[0m"; # config
GROOT="$PWD/files/groot"; BIN="game.exe"
export WINEESYNC=1; export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree=d;mshtml=d;"
export WINE="$(command -v wine)"
#export WINE="$GROOT/wine/bin/wine"
"$RUMTRICKS" isolate

session=$(tty)
SUB='pts'
if [[ "$session" =~ .*"$SUB".* ]]; then
	export GAMESCOPE=0
else; then
	if [[ $XDG_SESSION_TYPE == 'x11']];then
		export GAMESCOPE=0
fi


# FSR
FSR_MODE="${FSR:=}" # supported modes: ultra, quality, balanced, performance

# start
CMD=("$WINE" "$BIN"); [ -x "$GAMESCOPE" ] && { [[ -x "$RRES" && -n "$FSR_MODE" ]] && CMD=("$GAMESCOPE" -f $("$RRES" -g "$FSR_MODE") -- "${CMD[@]}") || CMD=("$GAMESCOPE" -f -- "${CMD[@]}"); }; [ "${DBG:=0}" = "1" ] || exec &>/dev/null
cd "$GROOT"; exec "${CMD[@]}" "$@"
