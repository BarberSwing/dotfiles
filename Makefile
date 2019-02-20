all: bash dconf dns nano quodlibet

bash:
	rsync home/bash_completion ~/.bash_completion
	rsync -r --delete home/bash_completion.d/ ~/.bash_completion.d/
	rsync home/bashrc ~/.bashrc
	rsync -r --delete home/bashrc.d/ ~/.bashrc.d/

dconf:
	dconf load / < home/config/dconf/global

dns:
	sudo rsync etc/resolv.conf /etc/resolv.conf

nano:
	rsync home/nanorc ~/.nanorc

quodlibet:
	rsync home/quodlibet/album_pattern ~/.quodlibet/album_pattern
	rsync home/quodlibet/config ~/.quodlibet/config
	rsync -r --delete home/quodlibet/lists/ ~/.quodlibet/lists/
	rsync home/quodlibet/songinfo ~/.quodlibet/songinfo

.PHONY: all bash dconf dns nano quodlibet
