#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "E: Usage: $0 <input_file>" >&2
    exit 1
fi

set -o errexit
set -o nounset

input_file="$1"

if [[ ! -f "$input_file" ]]; then
    echo "E: input file '$input_file' does not exist" >&2
    exit 1
fi

echo "converting '$input_file' to WebP and resizing to 1920x"
magick "$input_file" -strip -quality 80 -resize 1920x -define webp:lossless=false -define webp:method=6 "$input_file-compressed.webp"
