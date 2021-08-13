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

See [sample.env](sample.env) for configuration options.

## References

- [PostgreSQL environment variables](https://www.postgresql.org/docs/12/libpq-envars.html)
- [Rsnapshot tutorial in ArchWiki](https://wiki.archlinux.org/title/rsnapshot)
- [Fail fast bash scripting](https://dougrichardson.us/notes/fail-fast-bash-scripting.html)
- [Timezone support in Ubuntu containers](https://gist.github.com/sidja/833eb9824ada2684773553824f28e910)
