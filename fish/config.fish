if status is-interactive
    # Commands to run in interactive sessions can go here
end

# disable fish greeting
set fish_greeting

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
    echo ls
end

function last_history_item
    echo $history[1]
end

function new_term
    if test $argv
        $TERMINAL --working-directory (pwd) -e "$argv" &; disown
    else 
        $TERMINAL --working-directory (pwd) &; disown
    end
end

function ex
    if test -f $argv
        switch $argv
            case *.tar.bz2
				tar xjf $argv   
            case *.tar.gz
				tar xzf $argv   
            case *.bz2
				bunzip2 $argv   
            case *.rar
				unrar x $argv   
            case *.gz
				gunzip $argv    
            case *.tar
				tar xf $argv    
            case *.tbz2
				tar xjf $argv   
            case *.tgz
				tar xzf $argv   
            case *.zip
				unzip $argv     
            case *.Z
				uncompress $argv
            case *.7z
				7z x $argv      
            case *.deb
				ar x $argv      
            case *.tar.xz
				tar xf $argv    
            case *.tar.zst
				unzstd $argv    
            case '*'
				echo $argv cannot be extracted via ex()
        end
        echo $argv is not a valid file 
    end
end

# opens files in specified program
# kind of like xdg-open
function o
    for file in $argv
        set -l filetype (file -Lnb $file)

        if echo $filetype | grep 'HTML document' >/dev/null
            firefox --new-window $file
        else if echo $filetype | grep 'PDF document' >/dev/null
            zathura $file
            continue
        else if echo $filetype | grep 'ASCII text' >/dev/null
            bat $file
            continue
        else if echo $filetype | grep -E 'PNG|JPEG|JPG|SVG' >/dev/null
            feh -. $file
            continue
        else if echo $filetype | grep -E 'MPEG|MP4|MP3' >/dev/null
            continue
        else
            echo $filetype
        end
    end
end

# lets you ls on files to open/read them
function ls 
    if test \( -f "$argv[1]" -a ! -z "$argv[1]" \)
        o $argv
    else
        exa --icons -s type $argv
    end
end


#### Abbrieviations and aliases ####

# Aliases
alias c    'clear'
alias la   'exa --icons -s type -a'
alias ll   'exa --icons -s type -la --no-time --no-filesize'
alias lll  'exa --icons -s type -lahgmU --classify'
alias llll 'exa --icons -s type -laahHiUumg@ --changed --classify'
alias tree 'exa --icons --header -T'

# xdg enforcer aliases
alias wget 'wget --hsts-file="$XDG_DATA_HOME"/wget-hsts'

# Programs
abbr v 'nvim'
abbr q 'qalc'
abbr y 'yay'
abbr t 'tldr'
abbr d 'doas --'
abbr cp 'cp -iv'
abbr mv 'mv -iv'
abbr df 'df -h'
abbr nf 'neofetch'
abbr cm 'unimatrix -s 96'
abbr du 'du -sh'
abbr ln 'ln -s'
abbr nt 'new_term'
abbr cat 'bat'
abbr top 'btop'
abbr pwd 'pwd --physical'
abbr ntv 'new_term $EDITOR'
abbr feh 'feh -.'
abbr sudo 'doas --'
abbr doas 'doas --'
abbr --set-cursor e 'echo -e "%"'
abbr --set-cursor find "fd --hidden '%'"
abbr --position anywhere !! --function last_history_item
abbr --set-cursor timer 'sleep %m && notify-send --urgency=critical --wait "Timer Completed..."' 

# Git abbrieviations
abbr gs 'git status'
abbr ga 'git add'
abbr gp 'git push origin main'
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
abbr vi3 '$EDITOR ~/.config/i3/config ~/.config/i3/themes/$THEME.conf ~/.config/i3/keybinds.conf' 
abbr vhy '$EDITOR ~/.config/hypr/hyprland.conf' '$EDITOR ~/.config/hypr/keybinds.conf'
abbr vsx '$EDITOR ~/.config/sxhkd/bindings/*'
abbr vnv 'pushd   ~/.config/nvim; $EDITOR lua/custom/chadrc.lua; popd'
abbr vpo '$EDITOR ~/.config/polybar/themes/$THEME/*.ini'
abbr vpi '$EDITOR ~/.config/picom/picom.conf'
abbr vfi '$EDITOR ~/.config/fish/config.fish'
abbr vdu '$EDITOR ~/.config/dunst/dunstrc'
abbr vro '$EDITOR ~/.config/rofi/$THEME.rasi'
abbr vco '$EDITOR ~/.config/conky/conky.conf'
abbr val '$EDITOR ~/.config/alacritty/$THEME.yml'

# custom bindings
bind -M insert \cf accept-autosuggestion

# Startup ascii
if test "$TERM" = "alacritty"
    fish_vi_key_bindings
    blocks
else
    fish_default_key_bindings
end
