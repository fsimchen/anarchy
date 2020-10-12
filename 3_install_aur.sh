#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Instala pacotes do AUR . . ."
source ./toInstallAUR.sh
if [[ "${toInstallAUR[@]}" == "" ]] ; then
    echo "All AUR packages are already installed.";
else
    echo "Installing AUR packages: $(printf "%s " "${toInstallAUR[@]}")"
    for AURPKG in "${toInstallAUR[@]}"; do
        echo "Installing AUR package: $AURPKG"
        yay -S $AURPKG
    done
fi