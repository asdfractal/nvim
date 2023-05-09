#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run this script using 'sudo'"
  exit
fi

# Set env var due to sudo
export DOTFILES=/home/$SUDO_USER/projects/dotfiles

# Packages
echo ">> Installing docker..."
. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
echo ">> Installing zsh..."
. "$DOTFILES/install/zsh.sh"

# Symlink dotfiles
echo ">> Install complete - run symlink"
