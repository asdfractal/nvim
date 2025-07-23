#!/bin/bash

export DOTFILES=$(pwd)

. "$DOTFILES/install/docker.sh"
. "$DOTFILES/install/packages.sh"
. "$DOTFILES/install/brew.sh" fresh
. "$DOTFILES/install/zsh.sh"
. "$DOTFILES/install/symlink.sh" fresh

