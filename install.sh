#!/bin/sh

packages="kali-linux-everything
	  kali-desktop-i3
	  xclip
	  stow
	  most
	  valgrind
          exuberant-ctags
          toilet
          gobuster
          tree
          python3-setuptools
          python3-pip
          bloodhound
          neo4j
          vlc"


sudo apt update
sudo apt install $packages

pip3 install impacket
pip3 install bloodhound --user

mv ~/.zshrc ~/.zshrc.original
stow zsh
stow utils
stow vim
stow git

chsh -s $(which zsh)

mkdir -p ~/.config/i3
stow -t ~/.config/i3 i3
sudo dpkg -iR deb/

mkdir ~/.vpn

# Execute vlc as root
# sed -i s/geteuid/getppid/g /usr/bin/vlc
