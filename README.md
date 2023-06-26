# muh dot files

NOTE: If you are unlucky enough to find yourself looking at my awfully made bash scripts, this repo is pretty much for my own backup and educational purposes.

I have made near 0 effort in making my scripts functional on other setups (or just funcitonal in general tbh) so if you want to use my scripts, do so at your own peril.

Some of my i3 scripts rely on there being exactly 3 monitors (those that do will be detailed below) and the monitor names are hard coded.


### i3 Scripts

All in `i3/scripts`

---

- `next-free-workspace.sh` binding: `super + KP_Multiply` or `super + Shift + KP_Multiply`. Goes to, or moves a container to, the next free workspace that is on the same monitor as the focused one. Relies on the workspaces being assigned to the monitors in the layout described in `i3/config`.
- `swap-workspaces.sh` binding: `super + Shift + alt + TARGET_WS` (also works on numpad). The script for workspace swapping between monitors in the i3 docs only works for 2 monitors. This one works for any number of monitors. (Workspace names stay the same on each monitor)
- `change-theme.sh` binding: `super + t`. WARNING: this script goes around and overwrites some symbolic links in your configs, and relies heavily on having every link set up in a particular way. Read and understand this script before running it. You probably shouldn't bother with this one...
- `rotate-workspaces[-reverse].sh` binding: `super + Shift + alt + Left` or `super + Shift + alt + Right`. Moves wich workspaces display on each monitor by "rotating" them. (Workspace names stay the same on each monitor)
- `toggle-rounded-corners.sh` binding: `super + r`. Meant for the dracula-purple theme which uses picom and xborders.
- `grayscale-background.sh` binding: none. Run by `i3/themes/grayscale` to set the background on startup. if no `~/.fehbg` exists it will scroll through backgrounds in `~/pictures/wallpapers/grayscale/active` with 10 minute intervals.
- `ws-undo.py` binding: `super + z`. i3 IPC script that allows you to `super + z` back to the previous workspace.


### Rofi Scripts

All in `i3/scripts/rofi`

---

- `change-bg.sh` binding: `super + b`. Changes background with feh and update background to `~/.fehbg`. Looks inside of `~/pictures/wallpapers/` for wallpapers.
- `documentation.sh` binding: `super + d`. Opens offline stored documentation in `~/documentation/`. These are mostly websites just downloaded with `wget`. This script looks for an `index.html` (or symlink to one) in the root of the website's directory. e.g: `~/documentation/i3wm.org/index.html` is valid, `~/documentation/neovim.io/doc/user/index.html` is not.
- `screenshot.sh` binding: none currently. Gives multiple options for screenshot types (Box select, Window select etc.) and choice of saving to clipboard or save to `~/pictures/screenshots/`. Saved screenshots are just named the current unix time  +  `.png`
- `workspace.sh` binding: `super + Minus` or `super + Shift + Minus` (also works on keypad). Allows user to move to, or move a container to a workspace you don't have a keybinding for. You can also type in a workspace that doesn't exist yet to create it. 
- `change-theme.sh` binding: `super + t`. Theme selector uses `i3/themes/theme-list` file to invoke `i3/scripts/change-theme.sh`. WARNING: this script goes around and overwrites some symbolic links in your configs, and relies heavily on having every link set up in a particular way. Read and understand this script before running it. You probably shouldn't bother with this one...
- `marks.sh` binding: `super + m` or `super + Shift + m`. Latter binding creates a mark on the current container (see [i3 vim-like marks](https://i3wm.org/docs/userguide.html#vim_like_marks)) or overwrites an existing mark to a new container. Former binding lets you move too these marks.
- `sys-options.sh` binding: `super + Backspace`. Gives options to shutdown, restart, logout from i3 etc.
- `vbox.sh` binding: `super + v`. Displays and runs your virtualbox vms.
