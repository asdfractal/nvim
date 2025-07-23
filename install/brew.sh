#!/bin/bash
if [ "$1" == "fresh" ]; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

packages=(
  atuin
  bat
  binutils
  brotli
  btop
  bzip2
  curl
  direnv
  dust
  fzf
  gcc
  git
  git-delta
  glib
  go
  imagemagick
  lazydocker
  lazygit
  libheif
  libzip
  neovim
  ripgrep
  sevenzip
  the_silver_searcher
  tldr
  tmux
  tokei
  universal-ctags
)

brew install "${packages[@]}"
