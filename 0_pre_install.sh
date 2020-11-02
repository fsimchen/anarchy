#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Atualiza sistema . . ."
sudo pacman -Syyu --noconfirm

echo "Setting AUR repository mirrorlist . . ."
yay -S --noconfirm chaotic-mirrorlist
yay -S --noconfirm chaotic-keyring

pacman=('
sudo nano /etc/pacman.conf
[arcolinux_repo]
SigLevel = Never
Server = https://bike.seedhost.eu/arcolinux/$repo/$arch
Server = https://arcolinux.github.io/$repo/$arch

[arcolinux_repo_3party]
SigLevel = Never
Server = https://bike.seedhost.eu/arcolinux/$repo/$arch
Server = https://arcolinux.github.io/$repo/$arch

[arcolinux_repo_xlarge]
SigLevel = Never
Server = https://bike.seedhost.eu/arcolinux/$repo/$arch
Server = https://arcolinux.github.io/$repo/$arch

[chaotic-aur]
SigLevel = Never
Include = /etc/pacman.d/chaotic-mirrorlist

[andontie-aur]
SigLevel = Never
Server = https://aur.andontie.net/$arch

[chaotic-aur]
SigLevel = Never
Include = /etc/pacman.d/chaotic-mirrorlist

[andontie-aur]
SigLevel = Never
Server = https://aur.andontie.net/$arch

dotpac — Basic interactive script with ncurses-based text interface and helpful walkthrough. No merging or auto-merging features.
https://github.com/AladW/dotpac || dotpacAUR

')

sudo pacman -Syyu --noconfirm

echo "Dependency fix to install ttf-google-fonts-git . . ."
sudo pacman -Rdd adobe-source-code-pro-fonts --noconfirm
