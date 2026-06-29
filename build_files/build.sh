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

# Create arcade user
if ! getent passwd arcade > /dev/null; then
    useradd -d /var/home/arcade -m -s /bin/bash -G wheel arcade
    echo "arcade:arcade" | chpasswd
fi

# Create admin user
if ! getent passwd admin > /dev/null; then
    useradd -d /var/home/admin -m -s /bin/bash -G wheel admin
    echo "admin:${ADMIN_PASSWORD}" | chpasswd
fi

# don't enable if using tailscale --ssh
#systemctl enable sshd.service
systemctl enable tailscaled.service
#systemctl --global enable arcade-dconf.service
#systemctl mask getty@tty1.service
#systemctl mask getty@tty2.service
#systemctl mask getty@tty3.service
#systemctl mask getty@tty4.service
#systemctl mask getty@tty5.service
#systemctl mask getty@tty6.service


rm -f /etc/yum.repos.d/terra-mesa.repo
rm -f /etc/yum.repos.d/terra.repo