#
# ~/.config/fish/conf.d/env.fish
#

if status is-login
    # XDG spec
    set -x XDG_DATA_HOME	"$HOME/.local/share"
    set -x XDG_CONFIG_HOME	"$HOME/.config"
    set -x XDG_STATE_HOME	"$HOME/.local/state"
    set -x XDG_CACHE_HOME	"$HOME/.cache"

    fish_add_path ~/.local/bin
end
