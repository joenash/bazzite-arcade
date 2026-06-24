#!/bin/bash

set -ouex pipefail

# Create user
if ! id -u arcade > /dev/null 2>&1; then
    useradd -m -u 1000 -G wheel,video,audio,input -s /bin/bash arcade
fi

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

mkdir -p /home/arcade/.ssh
chown -R 1000:1000 /home/arcade

# SSH perms
chmod 700 /home/arcade/.ssh
chmod 600 /home/arcade/.ssh/authorized_keys

# Launcher perms
chmod +x /usr/bin/start-launcher.sh
chmod +x /usr/lib/launcher/*.x86_64

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable sshd.service
systemctl enable launcher.service
