#!/usr/bin/env zsh
-- Ashen Joker - Power Profile Menu

if ! command -v powerprofilesctl >/dev/null 2>&1; then notify-send "Power Profiles" "power-profiles-daemon belum terpasang." exit 1 fi

current=$(powerprofilesctl get)

choice=$(printf "Performance\nBalanced\nPower Saver" | wofi --dmenu --prompt "Power Profile" --width 240 --height 180)

case "$choice" in "Performance") powerprofilesctl set performance ;; "Balanced") powerprofilesctl set balanced ;; "Power Saver") powerprofilesctl set power-saver ;; *) exit 0 ;; esac

notify-send "Power Profile" "Mode aktif: $choice"

choice=$(printf "󰐥 Shutdown\n󰜉 Restart\n󰒲 Sleep" | wofi --dmenu --prompt "Power Menu" --width 220 --height 180)

case "$choice" in Shutdown) systemctl poweroff ;; Restart) systemctl reboot ;; Sleep) systemctl suspend ;; esac
