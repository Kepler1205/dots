#
# ~/.env
#

# XDG spec
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# XDG spec enforcers (using xdg-ninja)
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx NIMBLE_DIR "$XDG_DATA_HOME"/nimble
set -gx WINEPREFIX "$XDG_DATA_HOME"/wine
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -gx HISTFILE "$XDG_STATE_HOME"/bash/history
#set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

set -gx EDITOR "nvim"
set -gx TERMINAL "alacritty"
set -gx BROWSER "firefox"
set -gx THEME "grayscale"

# enable qt theming with qt5ct
set -gx QT_QPA_PLATFORMTHEME "qt5ct"

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/cargo/bin

# Use neovim as man pager
set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 999
