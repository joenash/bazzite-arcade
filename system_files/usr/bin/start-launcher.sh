#!/bin/bash

LAUNCHER_BIN="/usr/lib/launcher/emf_arcade_launcher.x86_64"
 
if [[ ! -x "$LAUNCHER_BIN" ]]; then
    echo "ERROR: Launcher binary not found or not executable: $LAUNCHER_BIN" >&2
    exit 1
fi

# Wait for GNOME Shell to be ready
until gdbus call --session \
    --dest org.gnome.Shell \
    --object-path /org/gnome/Shell \
    --method org.gnome.Shell.Eval 'true' &>/dev/null; do
    sleep 1
done

# Background worker to close the GNOME overview
(
    for i in {1..50}; do
        IS_OVERVIEW=$(gdbus call --session \
            --dest org.gnome.Shell \
            --object-path /org/gnome/Shell \
            --method org.freedesktop.DBus.Properties.Get \
            org.gnome.Shell OverviewActive 2>/dev/null)

        if [[ "$IS_OVERVIEW" == *'true'* ]]; then
            gdbus call --session \
                --dest org.gnome.Shell \
                --object-path /org/gnome/Shell \
                --method org.freedesktop.DBus.Properties.Set \
                org.gnome.Shell OverviewActive "<false>" &>/dev/null
            break
        fi
        sleep 0.1
    done
) &

while true; do
    "$LAUNCHER_BIN" --fullscreen || true
    sleep 2
done
 
