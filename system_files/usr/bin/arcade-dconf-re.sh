#!/bin/bash
dconf reset -f /

# Re-enable terminal via xdg-terminal-exec as well
rm /var/home/arcade/.config/xdg-terminals.list