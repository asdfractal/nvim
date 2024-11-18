#!/bin/bash

packages=(
  zsh
  etckeeper
  python3-pip
  postgresql
  postgresql-client
)

sudo apt install -y "${packages[@]}"
