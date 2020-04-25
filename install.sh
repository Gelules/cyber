#!/bin/sh

packages="kali-linux-everything \
	  kali-desktop-i3 \
	  xclip
	  stow
	  most
	  valgrind"


apt update
apt install $packages

stow zsh
stow utils
stow vim

chsh -s $(which zsh)
