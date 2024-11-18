/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew update
brew upgrade

packages=(
  atuin
  bat
  binutils
  brotli
  btop
  bzip2
  curl
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
  nvm
  ripgrep
  the_silver_searcher
  tldr
  tmux
  tokei
  universal-ctags
)

brew install "${packages[@]}"
