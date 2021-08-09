#!/bin/bash
if [ -z "$CIFS_USERNAME" ]; then
    echo "CIFS_USERNAME environment variable is not set"
    exit 1
fi

if [ -z "$CIFS_PASSWORD" ]; then
    echo "CIFS_PASSWORD environment variable is not set"
    exit 1
fi

if [ -z "$CIFS_SHARE" ]; then
    echo "CIFS_SHARE environment variable is not set"
    exit 1
fi

OPTIONS="user=$CIFS_USERNAME,pass=***,$CIFS_OPTIONS"
echo "Mounting $CIFS_SHARE to $RSNAPSHOT_ROOT ($OPTIONS)"
mount.cifs "$CIFS_SHARE" "$RSNAPSHOT_ROOT" -o "$OPTIONS"
