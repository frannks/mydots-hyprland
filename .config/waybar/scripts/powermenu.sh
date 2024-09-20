#!/bin/bash
lock="swaylock -f -i ~/.cache/wallpaper --effect-blur 10x5 --clock --indicator"

#### Options ###
power_off=" Shutdown"
reboot="󰜉 Reboot"
lock_screen=" Lock Screen"
suspend=" Suspend"
hibernate="󰒲 Hibernate"
log_out="󰍃 Log Out"

# Options passed to wofi
options="$power_off\n$reboot\n$lock_screen\n$suspend\n$hibernate\n$log_out"

# Define posições para centralizar
x=820
y=280

# Exibe todas as opções de uma vez usando wofi
chosen=$(echo -e "$options" | wofi --dmenu --insensitive --prompt "Power Menu:" --width 280 --height 290 --x $x --y $y)

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
        loginctl terminate-session "${XDG_SESSION_ID-}"
        ;;
esac

