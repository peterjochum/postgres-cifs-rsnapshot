#!/usr/bin/env -S bash -euET -o pipefail -O inherit_errexit
write-config-templates.sh
mount-backup-shares.sh
rsnapshot "$@"
cleanup.sh
