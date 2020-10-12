#!/usr/bin/env bash
source ./variables.sh
PKGS=(
    'base'
    'base-devel'
    'base'
    'base-devel'
    'linux'
    'linux-firmware'
    'git'
    'nano'
    'sudo'
    'wget'
    'curl'
    'grub'
    'lib32-alsa-plugins'
    'lib32-alsa-plugins'
    'deaweadasd'
)
source ./functions.sh

UNIQUEPKGS=($(echo "${PKGS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '));
_filterInstallMany "${UNIQUEPKGS[@]}";
