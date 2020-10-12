#!/usr/bin/env bash
source ./variables.sh
source ./packages.sh
source ./functions.sh

echo "Filtra os pacotes em arquivos . . ."
UNIQUEPKGS=($(echo "${PKGS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '));
_filterInstallMany "${UNIQUEPKGS[@]}";
