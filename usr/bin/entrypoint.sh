#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit

setup-timezone.sh
write-config-templates.sh
mount-backup-shares.sh
if [ "$USE_RSNAPSHOT" == "true" ];
then
echo "Using rsnapshot ..."
rsnapshot "$@"
else
echo "Backing up database"
echo "switching to $BACKUP_ROOT"
cd "$BACKUP_ROOT"
backup-database.sh
# Leave BACKUP_ROOT to allow cleanup.sh to unmount
cd /
fi
cleanup.sh
