#!/bin/bash
UMASK=$2
USER=$1
shift; shift; shift
umask $UMASK
eval exec /sbin/setuser $USER "$@"