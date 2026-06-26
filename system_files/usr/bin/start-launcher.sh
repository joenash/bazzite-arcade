#!/bin/bash

#steam -silent &
#sleep 3

LAUNCHER_BIN="/usr/lib/launcher/arcade-launcher.x86_64"
 
if [[ ! -x "$LAUNCHER_BIN" ]]; then
    echo "ERROR: Launcher binary not found or not executable: $LAUNCHER_BIN" >&2
    exit 1
fi

while true; do
    "$LAUNCHER_BIN" || true
    sleep 2
done
 
