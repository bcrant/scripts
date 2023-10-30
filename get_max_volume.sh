#! /bin/bash

set -e

echo
echo "Printing maximum volume of audio track(s)..."
echo

for f in $(ls | grep mono)
do 
    echo $f \
    && ffmpeg -hide_banner -i $f -filter:a volumedetect -f null /dev/null \
    |& grep max_volume 
done 
