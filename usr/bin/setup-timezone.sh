#!/bin/bash
if [ -z "$TZ" ]; then
echo "No timezone set - using $(cat /etc/timezone)"
else
echo "Setting up timezone $TZ"
ln -sfn "/usr/share/zoneinfo/$TZ" /etc/localtime && \
echo "$TZ" > /etc/timezone && \
dpkg-reconfigure --frontend noninteractive tzdata
fi
