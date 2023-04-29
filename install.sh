#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run this script using 'sudo'"
  exit
fi

# Set envvar for dotfiles dir
export DOTFILES=$HOME/projects/dotfiles

# Symlink dotfiles
. "$DOTFILES/install/symlink.sh"

# Packages
. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
. "$DOTFILES/install/zsh.sh"
