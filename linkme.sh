#!/bin/bash

for file in $HOME/.dotfiles/.[!.]*; do

    link="$HOME/$(basename $file)"
    echo "$link"

    if [ -f "$link" ]; then

        if ! [ -L "$link" ]; then
            mv -f "$link" "/tmp/$(basename $link)"
            echo "i am not a link and got moved"
        else
            rm "$link"
        fi
    fi

    ln -s "$file" "$link"

done
