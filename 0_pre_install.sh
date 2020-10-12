#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Setting sudo no password rights . . ."
sudo sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

echo "Atualiza sistema . . ."
sudo pacman -Syyu --noconfirm

echo "Setting AUR repository mirrorlist . . ."
yay -S --noconfirm chaotic-mirrorlist
yay -S --noconfirm chaotic-keyring

echo '' | sudo tee -a /etc/pacman.conf
echo '[arcolinux_repo_3party]' | sudo tee -a /etc/pacman.conf
echo 'SigLevel = Never' | sudo tee -a /etc/pacman.conf
echo 'Server = https://arcolinux.github.io/arcolinux_repo_3party/$arch' | sudo tee -a /etc/pacman.conf
echo '' | sudo tee -a /etc/pacman.conf
echo '[chaotic-aur]' | sudo tee -a /etc/pacman.conf
echo 'SigLevel = Never' | sudo tee -a /etc/pacman.conf
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf
echo '' | sudo tee -a /etc/pacman.conf
echo '[andontie-aur]' | sudo tee -a /etc/pacman.conf
echo 'SigLevel = Never' | sudo tee -a /etc/pacman.conf
echo 'Server = https://aur.andontie.net/$arch' | sudo tee -a /etc/pacman.conf
echo '' | sudo tee -a /etc/pacman.conf
echo '[sublime-text]' | sudo tee -a /etc/pacman.conf
echo 'SigLevel = Never' | sudo tee -a /etc/pacman.conf
echo 'Server = https://download.sublimetext.com/arch/stable/x86_64' | sudo tee -a /etc/pacman.conf
echo '' | sudo tee -a /etc/pacman.conf
sudo pacman -Syyu --noconfirm

echo "Dependency fix to install ttf-google-fonts-git . . ."
sudo pacman -Rdd adobe-source-code-pro-fonts --noconfirm
