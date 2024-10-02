#!/bin/sh

set -eu

ESC=$(printf '\033')

info() {
  printf "${ESC}[36m[INFO] %s${ESC}[m\n" "$@"
}

ok() {
  printf "${ESC}[32m[OK] %s${ESC}[m\n" "$@"
}

warn() {
  printf "${ESC}[33m[WARN] %s${ESC}[m\n" "$@"
}

run() {
  printf "${ESC}[35m[RUN] %s${ESC}[m\n" "$*"
  "$@"
}

symlink() {
  if [ -e "$1" ]; then
    if [ -L "$1" ]; then
      readlink=$(readlink -- "$1")
      if [ "$readlink" = "$2" ]; then
        ok "symlink: $1 => $2"
      else
        warn "symlink: $1 => $readlink (not $2)"
      fi
    else
        warn "symlink: not symlink $1"
    fi
  else
    run ln -s "$2" "$1"
  fi
}

self=$(realpath -- "$0")
base=${self%/*} && base=${base#"$HOME/"}

if [ -d /run/WSL ]; then
  info "Running on WSL."
  winhome="/mnt/c/Users/$USER"
  symlink ~/Downloads "$winhome/Downloads"
  symlink ~/Dropbox "$winhome/Dropbox"
  symlink ~/GoogleDrive "$winhome/Google ドライブ"
  symlink ~/temp "$winhome/temp"
  symlink ~/workspace "$winhome/workspace"
fi

symlink ~/.profile "$base/profile"
symlink ~/.bashrc "$base/bashrc"
symlink ~/.bash_logout "$base/bash_logout"
