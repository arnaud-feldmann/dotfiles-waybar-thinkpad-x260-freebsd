#!/bin/sh

CHARGING_ICON=""
SAVE_MODE_ICON=""
SAVE_MODE_STOP_ICON="󱈑"
BAT_ICONS="    "

BAT_CAP=$(sysctl hw.acpi.battery.life | awk '{print $2}')
BAT_STA=$(sysctl hw.acpi.battery.state | awk '{print $2}')
SAV_MOD=$(sudo $HOME/.config/waybar/conservation_mode.sh 0)

ACTIVE_SAV_ICON=$([ $SAV_MOD = 1 ] && echo "$SAVE_MODE_ICON";)
ACTIVE_BAT_ICON=$( \
	{ [ "$BAT_STA" = "2" ] && echo $CHARGING_ICON; } || \
    { [ $SAV_MOD = 1 ] && [ "$BAT_STA" = "0" ] && echo $SAVE_MODE_STOP_ICON; } || \
    { echo $BAT_ICONS | cut -d ' ' -f $(expr $BAT_CAP \* $(echo $BAT_ICONS | wc -w) / 100 + 1); }
)
ACTIVE_TEXT=$(echo "${BAT_CAP}%")

printf "%s  %s %s" $ACTIVE_SAV_ICON $ACTIVE_TEXT $ACTIVE_BAT_ICON

