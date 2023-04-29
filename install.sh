#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run this script using 'sudo'"
  exit
fi

# Set envvar for dotfiles dir
export DOTFILES=$HOME/projects/dotfiles
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
