#!bin/sh
# Scott's Install Script

sudo pacman -Syu --noconfirm

# Pacman Software to Install
pacman_list=(
  atom
  terminator
  zsh
  python-pip
  openssh
  git
  yaourt
  vim
  #gnome-break-timer
  #numix-icon-theme-circle
)
# Pacman Execution
sudo pacman -S ${pacman_list[@]} --noconfirm

# Change Shell to ZSH
chsh -s /usr/bin/zsh

# Enable SSH
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# Data Science
#pip_list=(
#  jupyter
#  pandas
#  matplotlib
#  scikit-learn
#  matplotlib
#)

sudo pip install ${pip_list[@]}

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
  #i3lock-blur
  corebird
  #dropbox
  #wps-office
  oh-my-zsh-git
  #flat-remix-git
  #lightdm-webkit2-theme-material2
)

# Install AUR packages
for pkg in ${yaourt_list[@]}
do
yaourt -S ${pkg}
done

#Set Up Scripts folder
git clone https://github.com/smblasik/Scripts ~/Scripts
ln ~/Scripts/.zshrc ~/.zshrc
#ln ~/Scripts/.i3config ~/i3/config
ln ~/Scripts/.virmc ~/.vimrc

cp ~/Scripts/X-Wing.jpg ~/Pictures/Wallpaper/X-Wing.jpg
cp ~/Scripts/BlackHat.png ~/Pictures/BlackHat.png

sudo reboot
