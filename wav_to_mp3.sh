#! /bin/bash

set -e

echo
echo "Converting grouped Zoom H4n WAV to maximum quality MP3..."

AUDIO_DIR="/users/brian/Dropbox/BrianCrantMusic/Audio"
DATES=(
	2023-12-30
	2023-12-31
)

for d in ${DATES[@]}
do 
	echo "Converting ${d} WAV to MP3..."
	MP3_DIR=${AUDIO_DIR}/${d}_mp3
	WAV_DIR=${AUDIO_DIR}/${d}
	mkdir -p ${MP3_DIR}
	cd ${WAV_DIR}
	for f in *
	do 
		ffmpeg -hide_banner -loglevel error -i ${f} -vn -ar 44100 -ac 2 -b:a 320k "${MP3_DIR}/${f%%.*}.mp3"
	done
	echo "Done converting ${d}."
done

