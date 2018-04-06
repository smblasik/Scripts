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
pip_list=(
  jupyter
  pandas
  matplotlib
  scikit-learn
  matplotlib
)

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

# Set default lightdm-webkit2-greeter theme to material2
#sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = material2 #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

#Set Up Scripts folder
git clone https://github.com/smblasik/Scripts ~/Scripts
ln ~/Scripts/.zshrc ~/.zshrc

cp ~/Scripts/X-Wing.jpg ~/Pictures/Wallpaper/X-Wing.jpg
cp ~/Scripts/BlackHat.png ~/Pictures/BlackHat.png

# Install VIM config
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=python&editor=vim' > ~/.vimrc

# Remove uneeded software
#sudo pacman -Rns hplip

sudo reboot
