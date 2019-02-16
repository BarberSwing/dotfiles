all: bash

bash:
	rsync home/bashrc ~/.bashrc
	rsync -r --delete home/bashrc.d/ ~/.bashrc.d/

.PHONY: all bash
