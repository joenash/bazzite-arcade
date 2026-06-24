#!/bin/bash

set -ouex pipefail

# Create user
if ! id -u arcade > /dev/null 2>&1; then
    useradd -m -u 1000 -G wheel -s /bin/bash arcade
fi

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

mkdir -p /home/arcade/.ssh
chown -R 1000:1000 /home/arcade

# SSH perms
#chmod 700 /home/arcade/.ssh
#chmod 600 /home/arcade/.ssh/authorized_keys

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

# Terra-mesa fix? https://github.com/osbuild/bootc-image-builder/issues/1188
if [ -f /etc/yum.repos.d/terra-mesa.repo ]; then
    sed -i 's|gpgkey=file:///etc/pki/rpm-gpg/|gpgkey=https://terra.fyralabs.com/|g' /etc/yum.repos.d/terra-mesa.repo
    # Alternatively, you can disable the repo checks entirely for the disk builder phase:
    # sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/terra-mesa.repo
fi

if [ -f /etc/yum.repos.d/terra.repo ]; then
    sed -i 's|gpgkey=file:///etc/pki/rpm-gpg/|gpgkey=https://terra.fyralabs.com/|g' /etc/yum.repos.d/terra.repo
fi