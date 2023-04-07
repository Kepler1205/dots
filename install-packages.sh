#!/bin/bash

echo "NOTE: this script will not setup any configuration. It only installs packages in an interactice way."

if ! which pacman; then
  echo "Pacman is not installed, this script is only for Arch / Arch based systems."
  exit 1
fi

if [ $USER == "root" ]; then 
  echo "This script needs to be run as the user account."
  exit 1
fi

if ! pacman -Q yay; then
  echo "Yay aur helper is not installed."
  echo "Would you like to install it? [y/n] "
  read instYay
  if [ instYay == "y" ]; then
    echo "Installing dependencies for yay.."
    sudo pacman -S --needed git base-devel
    echo "Git cloning yay repo (https://aur.archlinux.org/yay.git)..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    echo "Compiling yay..."
    makepkg -si
    cd ..
    echo "Cleaning build files..."
    rm -rf ./yay
    echo "Yay is installed."
  fi
fi

echo "NOTE: this script will not install or set up any graphics drivers."

install-from-file () {
  file=$1
  input="list"
  while [ $input == "list" ]; do
    echo "Install $file? [y/n/list] "
    read input
    if [ $input == "list" ]; then
      less ./install-lists/$file
    fi
    if [ $input == "y" ]; then
      yay --needed -S - < ./install-lists/$file
      echo "$file installed."
      echo ""
      if [ $file == "bare-essentials" ]; then
        echo "It is strongly reccomended for you to manually install your own graphics drivers at this point."
        echo "CTRL+C to exit the script."
      fi
      return 0
    fi
  done
}

install-from-file "bare-essentials"
install-from-file "useful-extras"
install-from-file "rice-essentials"
install-from-file "big-programs"
