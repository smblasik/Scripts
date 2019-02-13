#!bin/sh
# Scott's Install Script

sudo pacman -Syu --noconfirm

# Pacman Software to Install
packages="
  terminator 
  zsh 
  python-pip 
  yaourt 
  vim 
  corebird 
  numix-icon-theme-circle 
"
# Pacman Execution
sudo pacman -S --noconfirm $packages

# Change Shell to ZSH
sudo chsh -s `which zsh` $USER

# Enable SSH
# sudo systemctl enable sshd.service
# sudo systemctl start sshd.service

# Data Science
#pip_list=(
#  jupyter
#  random
#  pandas
#  matplotlib
#  scikit-learn
#  matplotlib
#)
#sudo pip install ${pip_list[@]}

# Set Yaourt to not prompt
echo NOCONFIRM=1 > ~/.yaourtrc
echo BUILD_NOCONFIRM=1 >>  ~/.yaourtrc
echo EDITFILES=0 >>  ~/.yaourtrc

# AUR Software to Install
yaourt_list=(
  google-chrome
  mojave-gtk-theme-git
  oh-my-zsh-git
)

# Install AUR packages
for pkg in ${yaourt_list[@]}
do
yaourt -S ${pkg}
done

#Set Up Scripts folder
git clone https://github.com/smblasik/Scripts ~/Scripts
ln ~/Scripts/.zshrc ~/.zshrc
ln ~/Scripts/.virmc ~/.vimrc

sudo reboot
