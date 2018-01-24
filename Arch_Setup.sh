#!bin/sh
sudo pacman -Syu --noconfirm

# Mac Wirless Drivers (Optional)
# sudo modprobe b43

# Pacman Software to Install
pacman_list=(
atom
terminator
zsh
python-pip
gnome-break-timer
numix-icon-theme-circle
steam
)
# Pacman Execution
sudo pacman -S ${pacman_list[@]} --noconfirm
# Change Shell to ZSH
chsh -s /usr/bin/zsh

# Install atom packages
atom_list=(
emmet
file-icons
platformio-ide-terminal
)

apm install ${atom_list[@]} ~/.atom/packages

# Set Yaourt to not prompt
echo NOCONFIRM=1 > ~/.yaourtrc
echo BUILD_NOCONFIRM=1 >>  ~/.yaourtrc
echo EDITFILES=0 >>  ~/.yaourtrc

# AUR Software to Install
yaourt_list=(
google-chrome
pycharm-community-edition
#boostnote
#dropbox
#wps-office
oh-my-zsh-git
flat-remix-git
)

# Install AUR packages
for pkg in ${yaourt_list[@]}
do
yaourt -S ${pkg}
done

git clone https://github.com/smblasik/Scripts ~/Scripts
#cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
ln ~/Scripts/.zshrc ~/.zshrc

cp ~/Scripts/X-Wing.jpg ~/Pictures/X-Wing.jpg

# Remove uneeded software
sudo pacman -Rns hplip

sudo reboot
