#!/bin/bash
lock="swaylock -f -i ~/.cache/wallpaper --effect-blur 10x5 --clock --indicator"

#### Options ###
power_off=" Shutdown"
reboot="󰜉 Reboot"
lock_screen=" Lock Screen"
suspend=" Suspend"
hibernate="󰒲 Hibernate"
log_out="󰍃﫼 Log Out"

# Options passed to fuzzel
options="$power_off\n$reboot\n$suspend\n$hibernate\n$log_out\n$lock_screen"
lines="$(echo "$options" | grep -oF '\n' | wc -l)"
background_color="282828ff"  # Cor hexadecimal com opacidade (ff = 100%)
rofi_command="fuzzel -d -w 14 -l $((lines+1)) -b $background_color"
chosen="$(echo -e "$options" | $rofi_command )"
case $chosen in
    "$lock_screen")
        swaylock
        ;;    
    "$power_off")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$suspend")
        $lock && systemctl suspend
        ;;
    "$hibernate")
        $lock && systemctl hibernate
        ;;
    "$log_out")
        #swaymsg exit
        loginctl terminate-session "${XDG_SESSION_ID-}"
        ;;
esac

