#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Increasing file watcher count . . ."
# This prevents a "too many files" error in Visual Studio Code
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

echo "Disabling module-esound-protocol-unix ..."
# Pulse audio loads the `esound-protocol` module, which best I can tell is rarely needed.
# That module creates a file called `.esd_auth` in the home directory which I'd prefer to not be there. So...
sudo sed -i 's|load-module module-esound-protocol-unix|#load-module module-esound-protocol-unix|g' /etc/pulse/default.pa

echo "Setting bluetooth ..."
sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf

echo "Enabling systemctl daemons ..."
#sudo systemctl enable lightdm.service
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now org.cups.cupsd.service
sudo systemctl enable --now ntpd.service
#sudo systemctl enable --now NetworkManager.service

#echo "Setting keymap on Xorg ..."
#sudo localectl set-x11-keymap $X11KEYMAP

#echo "Setting the amdgpu driver on grub..."
#sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="|GRUB_CMDLINE_LINUX_DEFAULT="radeon.cik_support=0 amdgpu.cik_support=1 radeon.si_support=0 amdgpu.si_support=1 |g' /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
#sudo sed -i 's|EndSection|        Option "TearFree" "on"\nEndSection|g' /usr/share/X11/xorg.conf.d/10-amdgpu.conf

echo "Setting VirtualBox ..."
sudo modprobe vboxdrv
sudo gpasswd -a $USER vboxusers

# VirtualBox theme fix
#sudo sed -i 's|Exec=VirtualBox %U|Exec=VirtualBox -style Fusion %U|g' /usr/share/applications/virtualbox.desktop
#mkdir $HOME/.local/
#mkdir $HOME/.local/share/
#mkdir $HOME/.local/share/applications/
#sudo cp /usr/share/applications/virtualbox.desktop $HOME/.local/share/applications/

#echo "Setting theme for AwesomeWM ..."
#git clone https://github.com/fsimchen/material-awesome.git $HOME/.config/awesome

# Same theme for Qt/KDE applications and GTK applications, and fix missing indicators
echo -e "XDG_CURRENT_DESKTOP=Unity\nQT_QPA_PLATFORMTHEME=gtk2" | sudo tee -a /etc/environment

# Theming
#git clone --depth 1 https://github.com/afraidofmusic/materia-theme-dracula.git
#cd materia-theme-dracula
#sudo ./install.sh
#cp ./configs/.gtkrc-2.0 $HOME/.gtkrc-2.0
#mkdir $HOME/.config/gtk-3.0
#cp ./configs/.gtk-3.0_settings.ini $HOME/.config/gtk-3.0/settings.ini
#gsettings set org.gnome.desktop.interface gtk-theme Materia-dark

#echo "Remove no password sudo rights . . ."
#sudo sed -i 's/^%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

echo -e "\nInstallation Complete!"
