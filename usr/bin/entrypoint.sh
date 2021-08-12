#!/usr/bin/env -S bash -euET -o pipefail -O inherit_errexit
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
fi
cleanup.sh
