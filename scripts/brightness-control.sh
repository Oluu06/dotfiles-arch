#!/bin/bash

#############################################
# Brightness Control Script
# Control screen brightness with notifications
#############################################

# Get current brightness
get_brightness() {
    brightnessctl get
}

# Get max brightness
get_max_brightness() {
    brightnessctl max
}

# Get brightness percentage
get_brightness_percent() {
    local current=$(get_brightness)
    local max=$(get_max_brightness)
    echo $((current * 100 / max))
}

# Send notification
send_notification() {
    local brightness=$(get_brightness_percent)
    
    if [ "$brightness" -lt 25 ]; then
        icon="display-brightness-low"
    elif [ "$brightness" -lt 75 ]; then
        icon="display-brightness-medium"
    else
        icon="display-brightness-high"
    fi
    
    notify-send -a "brightness" -u low -r 9994 -h int:value:"$brightness" -i "$icon" "Brightness: ${brightness}%" -t 2000
}

# Main
case "$1" in
    up)
        brightnessctl set +5%
        send_notification
        ;;
    down)
        brightnessctl set 5%-
        send_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
