#/bin/bash

OPTION=$(printf "Shutown PC\nRestart PC\nLogout i3\nReload i3\nRestart i3\nLock i3" | rofi -format i -dmenu)

case ${OPTION} in
  0) poweroff;;
  1) reboot;;
  2) i3-msg exit;;
  3) i3-msg reload;;
  4) i3-msg restart;;
  5) i3lock -c 000000
esac
