#!/usr/bin/env bash

PKGS=(
    'git'
    'nano'
    'sudo'
    'wget'
    'curl'
    'grub'
    'networkmanager'
    'dhclient'
    'network-manager-applet'
    'dialog'
    'os-prober'
    'mtools'
    'linux-headers'
    'reflector'
    'xdg-utils'
    'xdg-user-dirs'
    # --- XORG Display Rendering
    'xorg'                  # Base Package
    'xorg-drivers'          # Display Drivers 
    'xterm'                 # Terminal for TTY
    'xorg-server'           # XOrg server
    'xorg-apps'             # XOrg apps group
    'xorg-xinit'            # XOrg init
    'xorg-xinput'           # Xorg xinput
    'mesa'                  # Open source version of OpenGL

    # --- Setup Desktop
    'lxappearance'          # Set System Themes

    # --- Networking Setup
    'wpa_supplicant'            # Key negotiation for WPA wireless networks
    'openvpn'                   # Open VPN support
    'networkmanager-openvpn'    # Open VPN plugin for NM
    'libsecret'                 # Library for storing passwords

    # --- Audio
    'alsa-utils'        # Advanced Linux Sound Architecture (ALSA) Components https://alsa.opensrc.org/
    'alsa-plugins'      # ALSA plugins
    'pulseaudio'        # Pulse Audio sound components
    'pulseaudio-alsa'   # ALSA configuration for pulse audio
    'pavucontrol'       # Pulse Audio volume control

    # --- Bluetooth
    'bluez'                 # Daemons for the bluetooth protocol stack
    'bluez-utils'           # Bluetooth development and debugging utilities
    'blueberry'             # Bluetooth configuration tool
    'pulseaudio-bluetooth'  # Bluetooth support for PulseAudio
    'bluez-firmware'

    # --- Printers
    'cups'                  # Open source printer drivers
    'cups-pdf'              # PDF support for cups
    'ghostscript'           # PostScript interpreter
    'gsfonts'               # Adobe Postscript replacement fonts
    'hplip'                 # HP Drivers
    'system-config-printer' # Printer setup  utility

    # CUSTOM --------------------------------------------------------------
    'gtk-engine-murrine'
    'gtk-engines'
    'ttf-roboto'
    'noto-fonts-emoji'
    'qbittorrent'
    'sassc'
    'dbeaver'
    'exa'
    'docker'
    'docker-compose'
    # SYSTEM --------------------------------------------------------------
    'virtualbox'
    'virtualbox-host-modules-arch'
    'qt5-x11extras'
    'qt5ct'

    # TERMINAL UTILITIES --------------------------------------------------
    'bash-completion'       # Tab completion for Bash
    'bleachbit'             # File deletion utility
    'cronie'                # cron jobs
    'file-roller'           # Archive utility
    'gtop'                  # System monitoring via terminal
    'gufw'                  # Firewall manager
    'hardinfo'              # Hardware info app
    'htop'                  # Process viewer
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'numlockx'              # Turns on numlock in X11
    'openssh'               # SSH connectivity tools
    'p7zip'                 # 7z compression program
    'rsync'                 # Remote file sync utility
    'speedtest-cli'         # Internet speed via terminal
    'terminus-font'         # Font package with some bigger fonts for login terminal
    'tlp'                   # Advanced laptop power management
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'terminator'            # Terminal emulator
    'vim'                   # Terminal Editor
    'zenity'                # Display graphical dialog boxes via shell scripts
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # DISK UTILITIES ------------------------------------------------------
    'android-tools'         # ADB for Android
    'android-file-transfer' # Android File Transfer
    'autofs'                # Auto-mounter
    'dosfstools'            # DOS Support
    'exfat-utils'           # Mount exFat drives
    'gparted'               # Disk utility
    'parted'                # Disk utility
    'gvfs-mtp'              # Read MTP Connected Systems
    'gvfs-smb'              # More File System Stuff
    'nautilus'              # Filesystem browser
    'nautilus-share'        # File Sharing in Nautilus
    'ntfs-3g'               # Open source implementation of NTFS file system
    'samba'                 # Samba File Sharing
    'smartmontools'         # Disk Monitoring
    'smbclient'             # SMB Connection 
    'xfsprogs'              # XFS Support

    # GENERAL UTILITIES ---------------------------------------------------
    'flameshot'             # Screenshots
    'freerdp'               # RDP Connections
    'libvncserver'          # VNC Connections
    'remmina'               # Remote Connection
    'veracrypt'             # Disc encryption utility
    'variety'               # Wallpaper changer
    'ttf-fira-code'
    'qbittorrent'

    # DEVELOPMENT ---------------------------------------------------------
    'gedit'                 # Text editor
    'meld'                  # File/directory comparison
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'python'                # Scripting language
    'yarn'                  # Dependency management (Hyper needs this)

    # MEDIA ---------------------------------------------------------------
    'vlc'                   # Video player

    # GRAPHICS AND DESIGN -------------------------------------------------
    'gcolor2'               # Colorpicker
    'gimp'                 
    'ristretto'             # Multi image viewer

    # PRODUCTIVITY --------------------------------------------------------
    'hunspell'              # Spellcheck libraries
    'hunspell-en_US'           # English spellcheck library
    'xpdf'                  # PDF viewer

    # UTILITIES -----------------------------------------------------------
    'corectrl'
    'pamac-aur-git'
    'visual-studio-code-bin'
    'virtualbox-ext-oracle'
    'etcher-bin'
    'hunspell-pt-br'           # English spellcheck library

    # MEDIA ---------------------------------------------------------------
    'screenkey'                 # Screencast your keypresses

    # COMMUNICATIONS ------------------------------------------------------
    'firefox'

    # THEMES --------------------------------------------------------------
    #'materia-gtk-theme'             # Desktop Theme
    'papirus-icon-theme'            # Desktop Icons
    'capitaine-cursors'             # Cursor Themes
    'qt5-styleplugins'

    # CUSTOM --------------------------------------------------------------
    'arandr'
    'redshift'
    'ttf-google-fonts-git'
    'nerd-fonts-mononoki'
    'layan-cursor-theme-git'
    'wps-office'
    'wps-office-fonts'
    'wps-office-mime'
    'wps-office-extension-portuguese-brazilian-dictionary'
    'wps-office-mui-pt-br'
    'ttf-wps-fonts'
    'ttf-ms-fonts'
    'lutris'

    'wine-staging'
    'winetricks'
    'giflib'
    'lib32-giflib'
    'libpng'
    'lib32-libpng'
    'libldap'
    'lib32-libldap'
    'gnutls'
    'lib32-gnutls'
    'mpg123'
    'lib32-mpg123'
    'openal'
    'lib32-openal'
    'v4l-utils'
    'lib32-v4l-utils'
    'libpulse'
    'lib32-libpulse'
    'libgpg-error'
    'lib32-libgpg-error'
    'alsa-plugins'
    'lib32-alsa-plugins'
    'alsa-lib'
    'lib32-alsa-lib'
    'libjpeg-turbo'
    'lib32-libjpeg-turbo'
    'sqlite'
    'lib32-sqlite'
    'libxcomposite'
    'lib32-libxcomposite'
    'libxinerama'
    'lib32-libgcrypt'
    'libgcrypt'
    'lib32-libxinerama'
    'ncurses'
    'lib32-ncurses'
    'ocl-icd'
    'lib32-ocl-icd'
    'libxslt'
    'lib32-libxslt'
    'libva'
    'lib32-libva'
    'gtk3'
    'lib32-gtk3'
    'gst-plugins-base-libs'
    'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'
    'lib32-vulkan-icd-loader'
    'lib32-mesa'
    'vulkan-radeon'
    'lib32-vulkan-radeon'
    'vulkan-icd-loader'
    'lib32-vulkan-icd-loader'
    'lib32-gnutls'
    'lib32-libldap'
    'lib32-libgpg-error'
    'lib32-sqlite'
    'lib32-libpulse'
    'vulkan-tools'
    'vkd3d'
    'lib32-vkd3d'
    'lib32-vulkan-mesa-layers'
    'vulkan-mesa-layers'
    'lib32-alsa-plugins'
)
