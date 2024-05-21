#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

symlinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[ERROR] $destination exists but it's not a symlink." 
            # exit 1
        else
            ln -s "$filename" "$destination"
            echo "[OK] $filename -> $destination"
        fi
    else
        echo "[WARNING] $filename already symlinked"
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

            *)
                echo "[WARNING] Unknown operation $operation. Skipping..."
                ;;
        esac
    done
}


target=$1

if [[ -z "$target" ]]; then
  read -p "Choose the platform(linux/termux): " target
fi

if [[ "$target" == "linux" ]]; then
  echo "--- Linux config ---"
  deployManifest MANIFEST.linux
elif [[ "$target" == "termux" ]]; then
  echo "--- Termux config ---"
  deployManifest MANIFEST.termux
else
  echo "[ERROR] The platform '$target' MANIFEST doesn't exists!"
  exit 1
fi

