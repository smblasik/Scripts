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
# Change Shell to ZSH
chsh -s /usr/bin/zsh

# Data Science
pip_list=(
jupyter
pandas
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
chrome-gnome-shell
pycharm-community-edition
#boostnote
#dropbox
#wps-office
oh-my-zsh-git
flat-remix-git
lightdm-webkit2-theme-material2
)

# Install AUR packages
for pkg in ${yaourt_list[@]}
do
yaourt -S ${pkg}
done

# Set default lightdm-webkit2-greeter theme to material2
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = material2 #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

git clone https://github.com/smblasik/Scripts ~/Scripts
#cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
ln ~/Scripts/.zshrc ~/.zshrc

cp ~/Scripts/X-Wing.jpg ~/Pictures/X-Wing.jpg
cp ~/Scripts/BlackHat.png ~/Pictures/BlackHat.png

# Dicsord (Optional)
#yaourt -S discord
#gpg --recv-keys 0FC3042E345AD05D

# Remove uneeded software
sudo pacman -Rns hplip

sudo reboot
