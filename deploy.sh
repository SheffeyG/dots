#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"


symlinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")

    if [ ! -e "$filename" ]; then
        echo "[WARNING] Source '$filename' doesn't exist! skipped."
        return
    fi 

    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[WARNING] Target '$destination' exists but it's not a symlink! skipped."
        else
            ln -s "$filename" "$destination"
            echo "[OK] symlink: $filename -> $destination"
        fi
    else
        echo "[WARNING] Target '$filename' already symlinked! skipped."
    fi
}


copyFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")

    if [ ! -e "$filename" ]; then
        echo "[WARNING] Source '$filename' doesn't exist! skipped."
        return
    fi 

    if [ -e "$destination" ]; then
        echo "[WARNING] Target '$destination' already exists! skipped."
    else
        cp "$filename" "$destination"
        echo "[OK] copy: $filename -> $destination"
    fi
}


recursiveLink() {
    sourcepath="$1"
    targetpath="$2"

    for source in "$sourcepath"/*; do
        if [ -f "$source" ]; then
            symlinkFile $source $targetpath
        fi
        if [ -d "$source" ]; then
            recursiveLink $source $targetpath
        fi
    done
}


deployManifest() {
    for row in $(cat $SCRIPT_DIR/$1); do
        operation=$(echo $row | cut -d \| -f 1)
        source=$(echo $row | cut -d \| -f 2)
        target=$(echo $row | cut -d \| -f 3)

        case $operation in
            link) symlinkFile $source $target ;;

            copy) copyFile $source $target ;;

            rlink) recursiveLink $source $target ;;

            *) echo "[WARNING] Unknown operation '$operation', skipped." ;;
        esac
    done
}


# set -ex
manifest=$1

if [ -z "$manifest" ]; then
    echo "[ERROR] No MANIFEST file provided."
    exit 1
elif [ ! -e "$manifest" ]; then
    echo "[ERROR] MANIFEST file '$manifest' doesn't exists!"
    exit 1
fi

deployManifest $manifest

