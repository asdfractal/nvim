#!/bin/bash

packages=(
  zsh
  etckeeper
  python3-pip
  postgresql
  postgresql-client
)

sudo apt install -y "${packages[@]}"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
