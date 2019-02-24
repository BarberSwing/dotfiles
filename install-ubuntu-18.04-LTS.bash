#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
	echo "This script must be run as root"
	exit
fi

apt update
apt upgrade -y

apt_list=()
apt_list+=("audacity")
apt_list+=("clang")
apt_list+=("default-jdk")
apt_list+=("default-jre")
apt_list+=("ffmpeg")
apt_list+=("flac")
apt_list+=("gcc")
apt_list+=("gimp")
apt_list+=("git")
apt_list+=("libreoffice")
apt_list+=("make")
#apt_list+=("obs-studio")
apt_list+=("qemu-kvm")
apt_list+=("quodlibet")
apt_list+=("retroarch")
apt_list+=("transmission")
apt_list+=("vlc")

apt install -y "${apt_list[@]}"


snap refresh
snap install --classic android-studio
