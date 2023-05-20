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

function new_term
    if test $argv
        $TERMINAL --working-directory (pwd) -e $argv &; disown
    else 
        $TERMINAL --working-directory (pwd) &; disown
    end
end

#### Abbrieviations and aliases ####

# Aliases
alias c    'clear'
alias l    'exa --icons -s type -l --no-time --no-filesize'
alias ls   'exa --icons -s type'
alias la   'exa --icons -s type -a'
alias ll   'exa --icons -s type -la --no-time --no-filesize'
alias lll  'exa --icons -s type -lahgmU --classify'
alias llll 'exa --icons -s type -laahHiUumg@ --changed --classify'
alias tree 'exa --icons --header -T'

# Programs
abbr cp 'cp -iv'
abbr mv 'mv -iv'
abbr df 'df -h'
abbr --set-cursor cd 'cd % ;ls'
abbr --position anywhere v '$EDITOR'
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
abbr nt 'new_term'
abbr ntv 'new_term $EDITOR'
abbr feh 'feh --no-fehbg'
abbr --set-cursor e 'echo -e "%"'
abbr --set-cursor find "find . -iname '*%*'"
abbr --position anywhere !! --function last_history_item
abbr --set-cursor timer 'sleep %m && notify-send --urgency=critical --wait "Timer Completed..."' 

# Git abbrieviations
abbr gs 'git status'
abbr ga 'git add'
abbr gp 'git push'
abbr gd 'git diff'
abbr --set-cursor gc 'git commit -m "%"'

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
abbr --position anywhere romdir '/mnt/hdd/ROMs/'
abbr --position anywhere hdd '/mnt/hdd/'

# Vim Abbrieviations
abbr vi3 '$EDITOR -O ~/.config/i3/config ~/.config/i3/themes/$THEME.conf ~/.config/i3/keybinds.conf' 
abbr vnv 'cd ~/.config/nvim; $EDITOR lua/custom/chadrc.lua'
abbr vpo '$EDITOR -O ~/.config/polybar/themes/$THEME/*.ini'
abbr vpi '$EDITOR -O ~/.config/picom/picom.conf'
abbr vfi '$EDITOR ~/.config/fish/config.fish'
abbr vdu '$EDITOR ~/.config/dunst/dunstrc'
abbr vro '$EDITOR ~/.config/rofi/$THEME.rasi'
abbr vco '$EDITOR ~/.config/conky/conky.conf'
abbr val '$EDITOR ~/.config/alacritty/$THEME.yml'

# Startup ascii
if test "$TERM" = "alacritty"
    fish_vi_key_bindings
    colorscript random
else
    fish_default_key_bindings
end
