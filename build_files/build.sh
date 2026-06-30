#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Launcher perms
chmod +x /usr/bin/start-launcher.sh
chmod +x /usr/lib/launcher/*.x86_64

# tailscale perms
chmod +x /usr/bin/tailscale-firstboot.sh

# Burn the Wizards
rm -f /etc/xdg/autostart/ublue-firstboot.desktop
rm -f /etc/xdg/autostart/bazzite-portal.desktop

# Localise
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "KEYMAP=uk" > /etc/vconsole.conf

systemd-sysusers

# Set user passwords
echo "arcade:arcade" | chpasswd

chown -R arcade:arcade /etc/skel

if [ -n "${ADMIN_PASSWORD}" ]; then
    echo "admin:${ADMIN_PASSWORD}" | chpasswd
else
    echo "WARNING: ADMIN_PASSWORD environment variable is empty!"
fi

# don't enable if using tailscale --ssh
#systemctl enable sshd.service
systemctl enable tailscaled.service
systemctl mask getty@tty1.service
systemctl mask getty@tty2.service
systemctl mask getty@tty3.service
systemctl mask getty@tty4.service
systemctl mask getty@tty5.service
systemctl mask getty@tty6.service


rm -f /etc/yum.repos.d/terra-mesa.repo
rm -f /etc/yum.repos.d/terra.repo