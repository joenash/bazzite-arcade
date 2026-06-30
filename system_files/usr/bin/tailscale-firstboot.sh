#!/usr/bin/env bash
set -euo pipefail

MARKER="/var/lib/arcade/.tailscale-setup-complete"

# Already configured
[[ -f "$MARKER" ]] && exit 0

# Already logged into Tailscale?
if tailscale status --json 2>/dev/null | jq -e '.BackendState == "Running"' >/dev/null; then
    sudo mkdir -p "$(dirname "$MARKER")"
    sudo touch "$MARKER"
    exit 0
fi

echo
echo "========================================"
echo " Tailscale first-time setup"
echo "========================================"
echo

while true; do
    read -rsp "Enter your Tailscale auth key: " KEY
    echo

    if sudo tailscale up \
        --authkey="$KEY" \
        --advertise-tags=tag:arcade \
        --ssh \
        --reset; then
        break
    fi

    echo
    echo "Authentication failed."
    echo "Please try again."
    echo
done

unset KEY

sudo mkdir -p "$(dirname "$MARKER")"
sudo touch "$MARKER"

echo
echo "✓ Tailscale configured successfully."