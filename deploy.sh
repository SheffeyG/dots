#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

symlinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[WARNING] $destination exists but it's not a symlink. Skipping ..." 
            # exit 1
        else
            ln -s "$filename" "$destination"
            echo "[OK] $filename -> $destination"
        fi
    else
        echo "[WARNING] $filename already symlinked. Skipping ..."
    fi
}

copyFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ -e "$destination" ]; then
        echo "[WARNING] $destination already exists! Skipping ..."
        # exit 1
    else
        ln -s "$filename" "$destination"
        echo "[OK] $filename -> $destination"
    fi
}

deployManifest() {
    for row in $(cat $SCRIPT_DIR/$1); do
        filename=$(echo $row | cut -d \| -f 1)
        operation=$(echo $row | cut -d \| -f 2)
        destination=$(echo $row | cut -d \| -f 3)

        case $operation in
            symlink)
                symlinkFile $filename $destination
                ;;

            copy)
                copyFile $filename $destination
                ;;

            *)
                echo "[WARNING] Unknown operation $operation. Skipping..."
                ;;
        esac
    done
}

# set -ex
target=$1

if [[ -z "$target" ]]; then
    echo "[ERROR] You need provide a MANIFEST target."
    exit 1
elif [[ ! -e "$target" ]]; then
    echo "[ERROR] The MANIFEST target '$target' doesn't exists!"
    exit 1
fi

deployManifest $target

