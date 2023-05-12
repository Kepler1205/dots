if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# Vi mode changes
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Functions

function fish_prompt
  set_color green
  printf "$USER "
  set_color purple
  printf "$hostname "
  set_color white
  printf "$(date "+%T")\n"

  set_color blue
  if test "$(pwd | wc --chars)" -gt 50
    printf "$(prompt_pwd)"
  else 
    printf "$(pwd | sed "s/^\/home\/$USER/~/")"
  end

  if test "$USER" = "root"
    set_color red
    printf " # "
  else
    set_color purple
    printf " > "
  end

  set_color normal
end

function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

function last_history_item
  echo $history[1]
end

#### Abbrieviations and aliases ####

# Aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias df='df -h'
alias free='free -m'
alias ls='exa --icons -s type'
alias la='exa --icons -s type -a'
alias ll='exa --icons -s type -la --no-time --no-filesize'
alias lll='exa --icons -s type -lahgmU --classify'
alias llll='exa --icons -s type -laahHiUumg@ --changed --classify'
alias tree='exa -T --header --icons'
alias c='clear'

# Programs
abbr --position anywhere v 'nvim'
abbr nf 'neofetch'
abbr cm 'unimatrix -s 96'
abbr q 'qalc'
abbr top 'btop'
abbr du 'du -sh'
abbr y 'yay'
abbr pwd 'pwd --physical'
abbr ln 'ln -s'
abbr t 'tldr'
abbr d 'doas'
abbr sudo 'doas'
abbr ns 'alacritty --working-directory $(pwd) & disown'
abbr feh 'feh --no-fehbg'
abbr --set-cursor e 'echo -e "%"'
abbr --set-cursor find "find . -iname '*%*'"
abbr --position anywhere !! --function last_history_item
abbr --set-cursor timer 'sleep %m && notify-send --urgency=critical --wait "Timer Completed..."' 

# Git abbrieviations
abbr gs 'git status'
abbr ga 'git add'
abbr --set-cursor gc 'git commit -m "%"'
abbr gp 'git push'

# Program modifiers
abbr --set-cursor --position anywhere sed "sed 's/%/g'"
abbr --set-cursor --position anywhere grep "grep -i '%'"

# Directory Movement
abbr --add dotdot --regex '^\.\.+$' --function multicd

# File Location Abbrieviations
abbr --position anywhere cfi3 '~/.config/i3/scripts'
abbr --position anywhere cffi '~/.config/fish'
abbr --position anywhere cfpo '~/.config/polybar'
abbr --position anywhere cfpi '~/.config/picom'
abbr --position anywhere cfdu '~/.config/dunst'
abbr --position anywhere cfro '~/.config/rofi'
abbr --position anywhere cfco '~/.config/conky'
abbr --position anywhere cfal '~/.config/alacritty'

# Vim Abbrieviations
abbr vi3 'nvim -p ~/.config/i3/config ~/.config/i3/themes/$THEME.conf ~/.config/i3/keybinds.conf' 
abbr vnv 'nvim -p ~/.config/nvim/**.lua'
abbr vpo 'nvim -p ~/.config/polybar/themes/$THEME/*.ini'
abbr vpi 'nvim -p ~/.config/picom/picom.conf'
abbr vfi 'nvim ~/.config/fish/config.fish'
abbr vdu 'nvim ~/.config/dunst/dunstrc'
abbr vro 'nvim ~/.config/rofi/$THEME.rasi'
abbr vco 'nvim ~/.config/conky/conky.conf'
abbr val 'nvim ~/.config/alacritty/$THEME.yml'

# Startup ascii
blocks
