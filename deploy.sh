#!/usr/bin/env bash

SOURCE="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"
TARGET="$HOME"

function link() {
    local file="$SOURCE/$1"
    local dest="$TARGET/${2:+$2/}$1"

    mkdir -p "$(dirname "$dest")"

    if [ ! -e "$file" ]; then
        echo "[LINK] Skipped, source '$file' doesn't exist."
        return
    elif [ -L "$dest" ]; then
        echo "[LINK] Skipped, target '$dest' already symlinked."
        return
    elif [ -e "$dest" ]; then
        echo "[LINK] Skipped, target '$dest' exists but not a symlink."
        return
    fi

    ln -s "$file" "$dest" && echo "[LINK] $file -> $dest"
}

function copy() {
    local file="$SOURCE/$1"
    local dest="$TARGET/${2:+$2/}$1"

    mkdir -p "$(dirname "$dest")"

    if [ ! -e "$file" ]; then
        echo "[COPY] Skipped, source '$file' doesn't exist."
        return
    elif [ -e "$dest" ]; then
        echo "[COPY] Skipped, target '$dest' already exists."
        return
    fi

    cp -r "$file" "$dest" && echo "[COPY] $file -> $dest"
}

function ldir() {
    local sourcepath="$1"
    local targetpath="$2"

    for source in "$sourcepath"/*; do
        link "$source" "$targetpath"
    done
}

# set -ex

link    .zshrc
link    .p10k.zsh
link    .tmux.conf
copy    .gitconfig

link    nvim    .config
ldir    bin     .local

if [[ "$1" == "linux" ]]; then
    link    niri         .config
    link    alacritty    .config
    link    fuzzel       .config
    link    swaylock     .config
    link    way-edges    .config
fi

