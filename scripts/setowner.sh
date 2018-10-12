#!/bin/bash
DIRNAME=$(dirname "$1")
chown $PUID:$PGID -R "$DIRNAME"
