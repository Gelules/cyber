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

pip3 install bloodhound --user

stow zsh
stow utils
stow vim
stow git

chsh -s $(which zsh)

mkdir -p ~/.config/i3
stow -t ~/.config/i3 i3
dpkg -iR deb/

mkdir ~/.vpn

# Execute vlc as root
sed -i s/geteuid/getppid/g /usr/bin/vlc
