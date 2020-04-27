#!/bin/sh

packages="kali-linux-everything \
	  kali-desktop-i3 \
	  xclip
	  stow
	  most
	  valgrind
          exuberant-ctags
          toilet
          gobuster
          tree
          python3-impacket"


apt update
apt install $packages

stow zsh
stow utils
stow vim
stow git

chsh -s $(which zsh)

mkdir -p ~/.config/i3
stow -t ~/.config/i3 i3
dpkg -iR deb/

mkdir ~/.vpn
