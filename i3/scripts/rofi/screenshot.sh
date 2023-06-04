#!/usr/bin/env sh

OPTION1=$(printf "Box select\nTotal display\nMonitor select\nWindow select" \
    | rofi -format i -dmenu -theme-str \
        '#entry {
            placeholder: "Screenshot Type";
        }'
    )

OPTION2=$(printf "Copy to clipboard\nSave to ~/pictures/screenshots" \
    | rofi -format i -dmenu -theme-str \
        '#entry {
            placeholder: "Screenshot Location";
        }'
    )

case ${OPTION2} in 
  0) FLAGS="| xclip -selection clipboard -t image/png && notify-send -t 1500 'Selection copied to clipboard'";;
  1) FLAGS="~/pictures/screenshots/$(date +%s).png && notify-send -t 1500 'Selection saved to ~/pictures/screenshots/$(date +%s).png'"
esac

case ${OPTION1} in
  0) import $FLAGS;;
  1) import -window root $FLAGS;;
  2) import -window $(xdotool selectwindow) $FLAGS 
esac

# Remember to notify send confirmation of screenshot


