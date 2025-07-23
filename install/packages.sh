#!/usr/bin/env bash

packages=(
  dex
  etckeeper
  feh
  flameshot
  i3
  lua5.1
  liblua5.1-dev
  pasystray
  picom
  postgresql
  postgresql-client
  python3-pip
  rofi
  xinit
  zsh

)

sudo apt install -y "${packages[@]}"

