#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
	echo "This script must be run as root"
	exit
fi

apt update
snap refresh

apt install -y build-essential
apt install -y default-jdk
apt install -y default-jre
apt install -y flac
apt install -y git
apt install -y qemu-kvm
apt install -y transmission-gtk
snap install --classic android-studio
snap install --classic atom
snap install audacity
snap install ffmpeg
snap install gimp
snap install libreoffice
snap install obs-studio
snap install retroarch
