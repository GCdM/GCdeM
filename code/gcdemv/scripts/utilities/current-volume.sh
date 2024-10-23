# Returns current volume as fraction of 100
wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F': ' '{print $2 * 100}'
