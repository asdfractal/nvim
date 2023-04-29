apt update
apt upgrade -y

packages=(
  fzf
  ripgrep
  zsh
  etckeeper
  git
  neovim
  nano
  tmux
)

echo "Installing ${packages[@]}"
apt install -y "${packages[@]}"
