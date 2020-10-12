#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Instala pacotes . . ."
source ./toInstall.sh
if [[ "${toInstall[@]}" == "" ]] ; then
    echo "All packages are already installed.";
else
    echo "Installing packages: $(printf "%s " "${toInstall[@]}")"
    sudo pacman -S $(printf "%s " "${toInstall[@]}") --noconfirm --needed
fi
