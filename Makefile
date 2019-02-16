all: bash dns nano

bash:
	rsync home/bash_completion ~/.bash_completion
	rsync -r --delete home/bash_completion.d/ ~/.bash_completion.d/
	rsync home/bashrc ~/.bashrc
	rsync -r --delete home/bashrc.d/ ~/.bashrc.d/

dns:
	sudo rsync etc/resolv.conf /etc/resolv.conf

nanorc:
	rsync home/nanorc ~/.nanorc

.PHONY: all bash dns nano
