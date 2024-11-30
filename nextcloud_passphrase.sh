#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Este script deve ser executado como sudo ou root." >&2
    exit 1
else
    sudo docker exec nextcloud-aio-mastercontainer grep -E '"password":' /mnt/docker-aio-config/data/configuration.json | sed -E 's/^[^:]*:\s*"([^"]+)".*/\1/'
fi
