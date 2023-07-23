#/bin/bash

# rofi script to run localy stored websites
# intended to be used for opening documentation
#
# download documentation with
# wget --mirror --page-requisites --convert-links --no-clobber --no-parent --no-verbose <site-link>
# if <download-dir>/index.html does not exist, symlink that path to the index.html
#
#### NOTE:                                      ####
#### there must be an "index.html" or symlink   ####
#### to one in the root of the website dir      ####
#### e.g: "~/documentation/i3wm.org/index.html" ####

doc_path=$HOME/dox/documentation
[ -d $doc_path ] || exit

err() {
    notify-send --expire-time 2500 --urgency critical "ERROR: $1"
    exit 1
}

sel=$(ls $doc_path \
    | rofi -dmenu -theme-str \
        '#entry { 
            placeholder: "Documentation"; 
        }'
    )

[ -z "$sel" ] && exit 1
[ -e "$doc_path/$sel/index.html" ] || err "$doc_path/$sel/index.html does not exist"

[ $BROWSER = "firefox" ] && firefox --new-window $doc_path/$sel/index.html; exit 0
[ $BROWSER = "com.brave.Browser" ] && com.brave.Browser $doc_path/$sel/index.html; exit 0
