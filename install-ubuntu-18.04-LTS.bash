#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
	echo "This script must be run as root"
	exit
fi

apt update
snap refresh

apt install -y audacity
apt install -y build-essential
apt install -y default-jdk
apt install -y default-jre
apt install -y ffmpeg
apt install -y flac
apt install -y gimp
apt install -y git
apt install -y libreoffice
#apt install -y obs-studio
apt install -y qemu-kvm
apt install -y retroarch
apt install -y transmission
snap install --classic android-studio
