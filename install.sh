#!/bin/bash

# Set envvar for dotfiles dir
export DOTFILES=$HOME/projests/dotfiles

# Symlink dotfiles
. "$DOTFILES/install/symlink.sh"

# Package managers and packages
. "$DOTFILES/install/zsh.sh"
