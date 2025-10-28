#!/bin/bash

#############################################
# Audio Control Script
# Control volume with notifications
#############################################

# Get current volume
get_volume() {
    pamixer --get-volume
}

# Get mute status
is_muted() {
    pamixer --get-mute
}

# Send notification
send_notification() {
    local volume=$(get_volume)
    local muted=$(is_muted)
    
    if [ "$muted" = "true" ]; then
        notify-send -a "volume" -u low -r 9993 -h int:value:0 -i audio-volume-muted "Volume: Muted" -t 2000
    else
        if [ "$volume" -eq 0 ]; then
            icon="audio-volume-muted"
        elif [ "$volume" -lt 33 ]; then
            icon="audio-volume-low"
        elif [ "$volume" -lt 66 ]; then
            icon="audio-volume-medium"
        else
            icon="audio-volume-high"
        fi
        notify-send -a "volume" -u low -r 9993 -h int:value:"$volume" -i "$icon" "Volume: ${volume}%" -t 2000
    fi
}

# Main
case "$1" in
    up)
        pamixer -i 5
        send_notification
        ;;
    down)
        pamixer -d 5
        send_notification
        ;;
    mute)
        pamixer -t
        send_notification
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac
