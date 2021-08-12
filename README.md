# Rsnapshot based PostgreSQL Backup for CIFS storage

Mounts a CIFS share and perform a database backup.

The backup is written with a timestamp such as `dbname-20210812-0913.backup`.

When `USE_RSNAPSHOT` is set to true the configured backup rotations are applied.

## Usage

### docker-compose

1. Copy [sample.env](sample.env) to .env and configure your settings or setup
   environment.
1. Build the image `docker compose build`.
1. Execute `docker-compose run --rm backup hour` for an hourly backup.

### Sample configuration

```shell
# mount.cifs (man mount.cifs)
CIFS_SHARE=//my-server/share/
CIFS_USERNAME=
CIFS_PASSWORD=
CIFS_OPTIONS=noserverino,sec=ntlmsspi,vers=3.11

# Postgres variables (https://www.postgresql.org/docs/12/libpq-envars.html)
PGHOST=
PGPORT=5432
PGDATABASE=
PGUSER=
PGPASSWORD=

# Use rsnapshot or simple write .backup to BACKUP_ROOT
USE_RSNAPSHOT=true

# Rsnapshot retention settings
HOUR_STRING=hour
HOUR_RETENTION=720
DAY_STRING=day
DAY_RETENTION=180
WEEK_STRING=week
WEEK_RETENTION=108
MONTH_STRING=month
MONTH_RETENTION=60
YEAR_STRING=year
YEAR_RETENTION=100
```

## References

- [PostgreSQL environment variables](https://www.postgresql.org/docs/12/libpq-envars.html)
- [Rsnapshot tutorial in ArchWiki](https://wiki.archlinux.org/title/rsnapshot)
