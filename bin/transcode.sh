#!/bin/bash

readonly queue="$(cd "$(dirname "$0")" && pwd)/queue.txt"

input="$(sed -n 1p "$queue")"

while [ "$input" ]; do
    sed -i '' 1d "$queue" || exit 1
    transcode-video.sh "$input"
    input="$(sed -n 1p "$queue")"
done
