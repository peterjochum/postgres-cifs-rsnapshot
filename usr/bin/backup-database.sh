#!/bin/bash
TIMESTAMP=$(date "+%Y%m%d-%H%M")
FORMAT=backup
FILENAME=$PGDATABASE-$TIMESTAMP.$FORMAT
BACKUPPATH=.
FULLPATH=$BACKUPPATH/$FILENAME

echo "Backing up $PGDATABASE from $PGHOST:$PGPORT to $FULLPATH";
pg_dump --file "$FULLPATH" --format=c --blobs
