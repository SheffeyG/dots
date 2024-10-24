#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

symlinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[WARNING] $destination exists but it's not a symlink! skipped." 
            # exit 1
        else
            ln -s "$filename" "$destination"
            echo "[OK] symlink: $filename -> $destination"
        fi
    else
        echo "[WARNING] $filename already symlinked! skipped."
    fi
}

copyFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ -e "$destination" ]; then
        echo "[WARNING] $destination already exists! skipped."
        # exit 1
    else
        cp "$filename" "$destination"
        echo "[OK] copy: $filename -> $destination"
    fi
}

deployManifest() {
    for row in $(cat $SCRIPT_DIR/$1); do
        source=$(echo $row | cut -d \| -f 1)
        operation=$(echo $row | cut -d \| -f 2)
        target=$(echo $row | cut -d \| -f 3)

        case $operation in
            link) symlinkFile $source $target ;;

            copy) copyFile $source $target ;;

            rlink)  # recursisive symlink files
                for file in "$source"/*; do
                    if [ -f "$file" ]; then
                        symlinkFile $file $target
                        echo $file
                    fi
                done
            ;;

            *) echo "[WARNING] Unknown operation $operation, skipped." ;;

        esac
    done
}

# set -ex
manifest=$1

if [[ -z "$manifest" ]]; then
    echo "[ERROR] You need provide a MANIFEST file."
    exit 1
elif [[ ! -e "$manifest" ]]; then
    echo "[ERROR] MANIFEST file '$manifest' doesn't exists!"
    exit 1
fi

deployManifest $manifest

