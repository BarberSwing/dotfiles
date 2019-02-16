all: bash dns

bash:
	rsync home/bashrc ~/.bashrc
	rsync -r --delete home/bashrc.d/ ~/.bashrc.d/

dns:
	sudo rsync etc/resolv.conf /etc/resolv.conf

.PHONY: all bash dns
