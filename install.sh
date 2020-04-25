#!/bin/sh

packages="kali-linux-everything \
	  kali-desktop-i3 \
	  xclip
	  stow
	  most
	  valgrind
          exuberant-ctags"


apt update
apt install $packages

stow zsh
stow utils
stow vim
stow git

chsh -s $(which zsh)
