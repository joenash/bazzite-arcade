#!/bin/bash

#steam -silent &
#sleep 3

# Move to the directory so Godot can find its .pck file relative to the binary
cd /usr/lib/launcher/

while true; desktop
    echo "Starting EMF Arcade Launcher"

    ./emf_arcade_launcher.x86_64

    GAME_EXIT_STATUS=$?

    if [ $GAME_EXIT_STATUS -eq 100 ]; then
        echo "Maintenance mode. Exiting launcher."
        break
    fi
    
    # Crash or accidental exit
    echo "Launcher stopped unexpectedly with code $GAME_EXIT_STATUS. Restarting in 5s..."
    sleep 5
done