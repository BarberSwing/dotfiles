#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
	echo "This script must be run as root"
	exit
fi

main() {

	add_ppa ubuntuhandbook1/audacity # audacity
	add_ppa phoerious/keepassxc      # keepassxc
	#add_ppa obsproject/obs-studio   # obs-studio
	add_ppa lazka/ppa                # quodlibet
	add_ppa libretro/stable          # retroarch

	apt update
	apt upgrade -y

	apt_list=()
	apt_list+=("arandr")
	#apt_list+=("atom")
	apt_list+=("audacity")
	apt_list+=("clang")
	apt_list+=("default-jdk")
	apt_list+=("default-jre")
	apt_list+=("ffmpeg")
	apt_list+=("flac")
	apt_list+=("gcc")
	apt_list+=("gcc-multilib")
	apt_list+=("gimp")
	apt_list+=("git")
	apt_list+=("keepassxc")
	apt_list+=("libreoffice")
	apt_list+=("make")
	apt_list+=("nautilus-dropbox")
	apt_list+=("nitrogen")
	#apt_list+=("obs-studio")
	apt_list+=("redshift-gtk")
	#apt_list+=("qemu-kvm")
	apt_list+=("quodlibet")
	apt_list+=("retroarch")
	apt_list+=("rofi")
	apt_list+=("slock")
	apt_list+=("steam")
	apt_list+=("tint2")
	apt_list+=("transmission")
	apt_list+=("valgrind")

	apt install -y "${apt_list[@]}"

	apt autoremove
}

add_ppa() {
	for ppa in "${@}"; do
		grep -hr "^deb.*${ppa}" "/etc/apt/sources.list.d/" > /dev/null 2>&1
		if [ "${?}" -ne "0" ]; then
			echo "adding ppa:${ppa}"
			add-apt-repository -y "ppa:${ppa}"
		else
			echo "ppa:${ppa} already exists"
		fi
	done
}

main "${@}"
