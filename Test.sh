#!bin/sh
sudo pacman -Syu --noconfirm

# Pacman Software to Install
pacman_list=(
atom
terminator
zsh
python-pip
#gnome-break-timer
numix-icon-theme-circle
)
# Pacman Execution
sudo pacman -S ${pacman_list[@]} --noconfirm
