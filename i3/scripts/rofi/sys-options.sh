#/bin/bash

OPTION=$(printf "Shutown\nRestart\nLogout\nReload i3\nRestart i3\nLock" \
    | rofi -format i -dmenu -theme-str \
        '#entry {
            placeholder: "System Options";
        }'
    )

case ${OPTION} in
  0) poweroff;;
  1) reboot;;
  2) i3-msg exit;;
  3) i3-msg reload;;
  4) i3-msg restart;;
  5) i3lock -c 000000
esac
