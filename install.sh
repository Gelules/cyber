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
          python3-setuptools"


apt update
apt install $packages

# Impacket
pip3 install argparse pyasn1 pycryptodomex pyOpenSSL ldapdomaindump flask ldap3 pyReadline --user
mkdir ~/Downloads
cd ~/Downloads
git clone https://github.com/SecureAuthCorp/impacket
cd impacket
pip3 install .
cd ~/.oscp

stow zsh
stow utils
stow vim
stow git

chsh -s $(which zsh)

mkdir -p ~/.config/i3
stow -t ~/.config/i3 i3
dpkg -iR deb/

mkdir ~/.vpn
