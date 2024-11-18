#!/bin/bash

# Set env var due to sudo
export DOTFILES=$(pwd)
# export DOTFILES=/home/$SUDO_USER/projects/dotfiles

. "$DOTFILES/install/symlink.sh"
. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
. "$DOTFILES/install/brew.sh"
. "$DOTFILES/install/zsh.sh"

