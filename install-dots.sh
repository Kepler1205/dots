#!/bin/bash

local BACKUP_DIR="$XDG_DATA_HOME/configs.backups"

pushd $(dirname -- "$0")

# literally "ls" 
dirs=($(find . -maxdepth 1 -type d -not -path '*/.*' \
    | tail +2 \
    | sed 's/^.\///g'))

mkdir $BACKUP_DIR

for dir in ${dirs[@]}; do
    # save backups of original configs if they exist
    if [ -d $XDG_CONFIG_HOME/$dir ]; then
        mv $dir $BACKUP_DIR/
    fi
    
    # make links in .config to reference dots files
    ln -s --relative $(dirname -- "$0")"/$dir" "$XDG_CONFIG_HOME/$dir"

done

popd
