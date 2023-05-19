#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# XDG spec enforcers (using xdg-ninja)
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NIMBLE_DIR="$XDG_DATA_HOME"/nimble
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export THEME="grayscale"

# nvidia wayland support
#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

export PATH=/home/kepler/.local/share/cargo/bin:$PATH

# Use neovim as man pager
[[ $(which nvim) ]] && export MANPAGER="nvim +Man!"; export MANWIDTH=999

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || startx
fi
