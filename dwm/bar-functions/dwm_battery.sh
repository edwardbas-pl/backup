#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
	if [[ -d /sys/class/power_supply/BAT1 ]]
	then
    		CHARGE1=$(cat /sys/class/power_supply/BAT1/capacity)
		printf "%s" "$SEP1"
		if [ "$IDENTIFIER" = "unicode" ]; then
			if [ "$STATUS" = "Charging" ]; then
		            printf "🔌 %s%% %s" "$CHARGE1" "$STATUS1"
		        else
		            printf "🔋 %s%% %s" "$CHARGE1" "$STATUS1"
			fi
		else
        		printf "BAT %s%% %s" "$CHARGE1" "$STATUS1"
		fi
		printf "%s\n" "$SEP2"	STATUS1=$(cat /sys/class/power_supply/BAT1/status)
	fi

	if [[ -d /sys/class/power_supply/BAT2 ]]
	then
		CHARGE2=$(cat /sys/class/power_supply/BAT2/capacity)
		STATUS2=$(cat /sys/class/power_supply/BAT2/status)
		printf "%s" "$SEP1"
		if [ "$IDENTIFIER" = "unicode" ]; then
			if [ "$STATUS" = "Charging" ]; then
				printf "🔌 %s%% %s" "$CHARGE2" "$STATUS2"
			else
				printf "🔋 %s%% %s" "$CHARGE2" "$STATUS2"
			fi
		else
			printf "BAT %s%% %s" "$CHARGE2" "$STATUS2"
		fi
		printf "%s\n" "$SEP2"
	fi
    }

dwm_battery

