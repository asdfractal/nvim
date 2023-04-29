#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run this script using 'sudo'"
  exit
fi

# Set env var due to sudo
export HOMEDIR=/home/$SUDO_USER
export DOTFILES=$HOMEDIR/projects/dotfiles

# Packages
echo ">> Installing docker..."
. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
echo ">> Installing zsh..."
. "$DOTFILES/install/zsh.sh"

# Symlink dotfiles
echo ">> Symlinking dotfiles..."
. "$DOTFILES/install/symlink.sh"
echo ">> Install complete - restart shell"
