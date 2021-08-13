FROM ubuntu:20.04

# Install software
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install --no-install-recommends --yes \
    rsnapshot postgresql-client cifs-utils keyutils gettext-base tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration
COPY templates /templates/

# Copy executables
COPY usr/bin/* /usr/bin/

# Set default parameters
ENV BACKUP_ROOT=/rsnapshot-root
RUN mkdir "${BACKUP_ROOT}"

# Work at FS root (needed by write-config-templates)
WORKDIR /

# Start rsnapshot
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
