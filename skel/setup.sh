#!/usr/bin/env bash

#
# this script is to be run after account creation to
# establish environmnet vars and remove unneeded files
#

bash_setup() {
    rm $HOME/.env.fish
    rm $HOME/.fishrc
    rmdir $HOME/.config/fish/conf.d
    rmdir $HOME/.config/fish

    mv $HOME/.env.bash $HOME/.env
    echo -e "\n\n# load local env vars\n[[ -f ~/.env ]] && . ~/.env" >> .bash_profile
}

fish_setup() {
    rm $HOME/.env.bash
    
    mv $HOME/.env.fish $HOME/.config/fish/conf.d/env.fish
}

case $SHELL in
    "/bin/bash") bash_setup;;
    "/usr/bin/bash") bash_setup;;
    "/bin/zsh") bash_setup;;
    "/usr/bin/zsh") bash_setup;;
    "/bin/fish") fish_setup;;
    "/usr/bin/fish") fish_setup;;
    *) echo "setup.sh: ERROR unknown shell";;
esac

