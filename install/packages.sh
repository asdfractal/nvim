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
  python3-pip
  awscli
  postgresql
  postgresql-client
  restic
  unzip
)

echo ">> Installing ${packages[@]}"
apt install -y "${packages[@]}"
