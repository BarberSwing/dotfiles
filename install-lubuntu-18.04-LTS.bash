#!/bin/bash

if [ "${EUID}" -ne 0 ]; then
	echo "This script must be run as root"
	exit
fi

main() {
	add_ppa ubuntuhandbook1/audacity # audacity
	add_ppa phoerious/keepassxc      # keepassxc
	add_ppa lazka/ppa                # quodlibet
	add_ppa libretro/stable          # retroarch

	apt update
	apt upgrade -y

	packages=()
	packages+=("arandr")
	packages+=("audacity")
	packages+=("clang")
	packages+=("default-jdk")
	packages+=("default-jre")
	packages+=("gcc")
	packages+=("gimp")
	packages+=("git")
	packages+=("keepassxc")
	packages+=("libreoffice")
	packages+=("numix-gtk-theme")
	packages+=("numix-icon-theme")
	packages+=("quodlibet")
	packages+=("redshift-gtk")
	packages+=("retroarch")
	packages+=("rofi")
	packages+=("steam")
	packages+=("steam-devices")
	packages+=("transmission")
	packages+=("valgrind")
	packages+=("xbacklight")

	apt install -y "${packages[@]}"

	apt autoremove -y
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
