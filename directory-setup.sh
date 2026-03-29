#!/bin/bash

# Check if the script is being run as root (UID 0)
if [ "$EUID" -ne 0 ]; then
  echo "/data directory failed to create. Make sure to run the script in sudo or root."
  exit 1
fi

# Attempt to create the directory
mkdir -p /data

# Attempt to change ownership
chown 1000:1000 /data

# Confirm success
echo "/data is created and is owned by user 1000."
