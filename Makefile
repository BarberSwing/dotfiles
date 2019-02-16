all: bash

bash:
	rsync home/bashrc ~/.bashrc

.PHONY: all bash
