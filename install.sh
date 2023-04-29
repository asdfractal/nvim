#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run this script using 'sudo'"
  exit
fi

# Set env var due to sudo
export HOMEDIR=/home/asdfractal
export HOMEUSER=asdfractal
export DOTFILES=$HOMEDIR/projects/dotfiles
echo $DOTFILES

# Symlink dotfiles
echo "Symlinking dotfiles..."
. "$DOTFILES/install/symlink.sh"

# Packages
echo "Installing docker..."
. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
echo "Installing zsh..."
. "$DOTFILES/install/zsh.sh"
echo "Install complete - restart shell"
