if status is-interactive
	fastfetch

	fish_vi_key_bindings
	# Vi mode changes
	set fish_cursor_default block
	set fish_cursor_insert line
	set fish_cursor_replace_one underscore
	set fish_cursor_visual block
end

if status is-login
	if test -f ~/.config/fish/env.fish
		. ~/.config/fish/env.fish
	end

	# autostart desktop on tty1
	if test $(tty) = /dev/tty1
		startx
	else
		# TTY dracula theme
		if test $TERM = linux
			printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
			printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
			# printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
			printf %b '\e]P00a0a0a'    # redefine 'black'          as 'dracula-bg'
			printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
			printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
			printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
			printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
			printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
			printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
			printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
			printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
			printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
			printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
			printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
			printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
			printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
			printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
			printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
			clear

			if which tmux > /dev/null
				tmux
			end
		end
	end
end

# disable fish greeting
set fish_greeting

# Functions

# use custom vi mode indicator
function fish_mode_prompt; end

function fish_right_prompt
	switch $fish_bind_mode
		case insert
		case replace_one
		case default
			set_color red
			printf "-- NORMAL --"
		case visual
			set_color brmagenta
			printf "-- VISUAL --"
		case replace
			set_color yellow
			printf "-- REPLACE --"
		case '*'
			set_color red
			# printf "?"
			printf "$fish_bind_mode"
	end

	if test $status -ne 0
		set_color red
		printf $status
	end
	set_color normal
end

function fish_prompt

    set -l cmd_status $status
    if test $cmd_status -ne 0
        set_color -b black
    end


    set_color green
	printf "%s " (whoami)
    set_color purple
    printf "%s " (prompt_hostname)

	#
	# if git rev-parse --is-inside-work-tree &> /dev/null 
	# 	set_color --bold red
	# 	printf (git rev-parse --abbrev-ref HEAD)
	# 	set_color brgreen
	# 	printf '['
	# 	set_color yellow
	# 	# local hash = git rev-parse HEAD 2> /dev/null | string sub -l 5 
	# 	printf (git rev-parse HEAD 2> /dev/null | string sub -l 5)
	# 	set_color brgreen
	# 	printf ']'
	# end
	#
	echo

	if test $cmd_status -ne 0
		set_color -b normal
	end

    set_color blue
    if test (pwd | string length) -gt 50
      printf (prompt_pwd)
    else 
      # printf (pwd | sed "s|$HOME|~|")
	  printf (pwd | string replace $HOME '~')
    end
    
    if fish_is_root_user
      set_color red
      printf " # "
    else
      set_color purple
      printf " > "
    end
    
    set_color normal
end

function cd
	builtin cd $argv ; ls -a
end

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
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

# opens files in specified program
# kind of like xdg-open
function o
    for file in $argv
        set -l filetype (file -Lnb $file)

        if echo $filetype | grep 'HTML document' >/dev/null
            firefox --new-window $file
        else if echo $filetype | grep 'PDF document' >/dev/null
            zathura $file
        else if echo $filetype | grep 'ASCII text' >/dev/null
            bat $file
        else if echo $filetype | grep -E 'PNG|JPEG|JPG|SVG' >/dev/null
            feh -. $file
        else if echo $filetype | grep -E 'MPEG|MP4|MP3' >/dev/null
			mpv $file
        else
			bat $file
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
alias c    'clear -x'
alias la   'eza --icons -s type -a'
alias ll   'eza --icons -s type -la --no-time --no-filesize'
alias lll  'eza --icons -s type -lahgmU --classify'
alias llll 'eza --icons -s type -laahHiUumg@ --changed --classify'
alias tree 'eza --icons --header -T'

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
abbr ff 'fastfetch'
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
abbr clear 'clear -x'
abbr --set-cursor e 'echo -e "%"'
abbr --position anywhere !! --function last_history_item
abbr --set-cursor timer 'sleep %m && notify-send --urgency=critical --wait "Timer Completed..."' 
abbr --set-cursor async '% & disown'

# Git abbrieviations
abbr gs 'git status'
abbr ga 'git add'
abbr gd 'git diff'
alias gll "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
abbr --set-cursor gc 'git commit -m "%"'

# Program modifiers
abbr --set-cursor --position anywhere sed "sed 's/%/g'"
abbr --set-cursor --position anywhere grep "grep -i '%'"

# Directory Movement
abbr --add dotdot --regex '^\.\.+$' --function multicd

# custom bindings
bind -M insert \cf accept-autosuggestion
