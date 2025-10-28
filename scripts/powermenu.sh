#!/bin/bash

#############################################
# Power Menu
# Rofi-based power menu
#############################################

# Options
option1=" Lock"
option2=" Logout"
option3=" Reboot"
option4=" Shutdown"
option5=" Cancel"

# Rofi command
rofi_cmd() {
    rofi -dmenu \
        -p "Power Menu" \
        -mesg "Uptime: $(uptime -p | sed -e 's/up //g')" \
        -theme ~/.config/rofi/launchers/powermenu.rasi
}

# Pass options to rofi
run_rofi() {
    echo -e "$option1\n$option2\n$option3\n$option4\n$option5" | rofi_cmd
}

# Confirmation dialog
confirm_exit() {
    echo -e "Yes\nNo" | rofi -dmenu \
        -p "Are you sure?" \
        -theme ~/.config/rofi/launchers/powermenu.rasi
}

# Execute command
run_cmd() {
    if [[ $1 == '--opt1' ]]; then
        betterlockscreen -l
    elif [[ $1 == '--opt2' ]]; then
        if [[ $(confirm_exit) == "Yes" ]]; then
            bspc quit
        fi
    elif [[ $1 == '--opt3' ]]; then
        if [[ $(confirm_exit) == "Yes" ]]; then
            systemctl reboot
        fi
    elif [[ $1 == '--opt4' ]]; then
        if [[ $(confirm_exit) == "Yes" ]]; then
            systemctl poweroff
        fi
    fi
}

# Main
chosen="$(run_rofi)"
case ${chosen} in
    $option1)
        run_cmd --opt1
        ;;
    $option2)
        run_cmd --opt2
        ;;
    $option3)
        run_cmd --opt3
        ;;
    $option4)
        run_cmd --opt4
        ;;
esac
