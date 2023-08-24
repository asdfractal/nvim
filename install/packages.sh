apt update
apt upgrade -y

packages=(
  fzf
  ripgrep
  zsh
  etckeeper
  tmux
  python3-pip
  awscli
  postgresql
  postgresql-client
  restic
  unzip
  nodejs
  npm
)

echo ">> Installing ${packages[@]}"
apt install -y "${packages[@]}"
