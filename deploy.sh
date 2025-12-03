#!/usr/bin/env bash

SOURCE="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"
TARGET="$HOME"

function symlinkFile() {
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

function copyFile() {
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

function linkDirectory() {
    local sourcepath="$1"
    local targetpath="$2"

    for source in "$sourcepath"/*; do
        symlinkFile "$source" "$targetpath"
    done
}

# set -ex
MANIFEST="$1"

if [ -z "$MANIFEST" ]; then
    echo "[ERROR] No MANIFEST file provided!"
    exit 1
elif [ ! -e "$MANIFEST" ]; then
    echo "[ERROR] MANIFEST file '$MANIFEST' doesn't exists!"
    exit 1
fi

while IFS='|' read -r opt src tgt; do
    opt="$(printf '%s' "$opt" | tr -d '[:space:]')"
    src="$(printf '%s' "$src" | tr -d '[:space:]')"
    tgt="$(printf '%s' "$tgt" | tr -d '[:space:]')"

    case "$opt" in
        link) symlinkFile "$src" "$tgt" ;;
        copy) copyFile "$src" "$tgt" ;;
        ldir) linkDirectory "$src" "$tgt" ;;
        *) echo "[WARNING] Unknown operation '$opt'!" ;;
    esac
done <"$SOURCE/$MANIFEST"
