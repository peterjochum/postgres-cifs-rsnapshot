FROM ubuntu:20.04

# Install software
RUN apt-get update
RUN apt-get install --no-install-recommends --yes \
    rsnapshot postgresql-client cifs-utils gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration
COPY templates /templates/

# Copy executables
COPY usr/bin/* /usr/bin/

# Set default parameters
ENV RSNAPSHOT_ROOT=/rsnapshot-root
RUN mkdir "${RSNAPSHOT_ROOT}"

# Work at FS root (needed by write-config-templates)
WORKDIR /

# Start rsnapshot
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
