#!/bin/bash

#export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8
#export LC_CTYPE="en_US.UTF-8"
echo $HOME
echo $USER
sleep 20
TORRENT_NAME="$1"
TORRENT_LABEL="N/A"
TORRENT_NEW_PATH="$MOVIES_PATH/$TORRENT_NAME"

# MOVIES_PATH=Path where you keep real movies
# MEDIA_OUTPUT_PATH=Path where "movies" folder is where you have symlinks
# If MEDIA_PATH or MEDIA_OUTPUT_PATH is empty then exit
if [ -z $TORRENT_NAME ] || [ -z $MOVIES_PATH ] || [ -z $MEDIA_OUTPUT_PATH ]; then
    exit 0
fi

if [ ! -d "$TORRENT_NEW_PATH" ]; then
    exit 0
fi

#chown $PUID:$PGID -R $TORRENT_NEW_PATH
THEFILE=""

SUBLANG=en
SKIP_EXTRACT=n
MUSIC=y
ARTWORK=false

filebot -script fn:amc \
    --output "$MEDIA_OUTPUT_PATH" \
    -non-strict \
    --encoding utf8 \
    --log all \
    --log-file amc-transmission.log \
    --action symlink \
    --conflict auto \
    --def exec="THEFILE=\"{f}\"" \
    --def artwork=$ARTWORK \
    ut_kind=multi "ut_dir=\"$TORRENT_NEW_PATH\"" "ut_title=\"$TORRENT_NAME\"" \
    subtitles=$SUBLANG \
    movieFormat="movies/{n} ({y})/{n} ({y}){' CD'+pi}{'.'+lang}" \
    extractFolder="$HOME/files/_extracted" music=$MUSIC skipExtract=$SKIP_EXTRACT &

if [ ! -z $THEFILE ]; then 
#/scripts/setowner.sh "$THEFILE"
fi