#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Launcher perms
chmod +x /usr/bin/start-launcher.sh
chmod +x /usr/lib/launcher/*.x86_64

# Burn the Wizards
rm -f /etc/xdg/autostart/ublue-firstboot.desktop
rm -f /etc/xdg/autostart/bazzite-portal.desktop

# Localise
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "KEYMAP=uk" > /etc/vconsole.conf

# Create user
if ! getent passwd arcade > /dev/null; then
    useradd -d /var/home/arcade -m -s /bin/bash -G wheel arcade
    #passwd -d arcade
    echo "arcade:arcade" | chpasswd
fi

#systemctl enable sshd.service

rm -f /etc/yum.repos.d/terra-mesa.repo
rm -f /etc/yum.repos.d/terra.repo