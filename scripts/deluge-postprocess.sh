#!/bin/bash
USERNAME=$(getent passwd "$PUID"  | cut -d: -f1)
/files/runas.sh $USERNAME $UMASK /scripts/filebot.sh "$1" "$USERNAME"