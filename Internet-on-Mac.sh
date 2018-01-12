#!/bin/sh

#cd ~
#curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/broadcom-wl.tar.gz
#tar -zxvf broadcom-wl.tar.gz
#cd broadcom-wl
#makepkg -s
sudo pacman -S linux-headers broadcom-wl-dkms
#sudo rmmod b43
#sudo rmmod ssb
sudo modprobe b43
#cd ~ 
#rm -r broadcom*


