# EMF ArcadeOS

This repository is used to build the operating system for the PCs in the EMF 2026 arcade. The OS is a custom [bootc](https://github.com/bootc-dev/bootc) image, based on [Bazzite](https://bazzite.gg/).

## Installing

The steps should mostly be similar to the [official Bazzite steps](https://docs.bazzite.gg/General/Installation_Guide/install-guide/).

### Creating the bootable media

Grab the .iso from the latest [Build disk images](https://github.com/joenash/bazzite-arcade/actions/workflows/build-disk.yml) run, and write it to media using one of the following tools:

- [Fedora Media Writer](https://github.com/FedoraQt/MediaWriter)
- [Rufus](https://rufus.ie/en/)

### Installing the image

Plug the written media into the target machine and reboot. You may have to access the BIOS or select boot media using F11/F12 keys during startup.

Once you have selected the correct device, it will boot into the installer. You will need to select a hard drive to install to. If the hard drive has an existing OS on it, select "Delete all" after selecting the drive.

### Post-install

After installing, the OS will perform some setup, after which it will restart again. During the first full boot, it will take you to desktop where you will see a prompt to enter a Tailscale authkey. At this point, setup is complete and the machine is ready to travel to EMF.
