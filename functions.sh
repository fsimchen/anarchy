#!/usr/bin/env bash

_exist() {
    package="$1";
    check="$(pacman -Ss "${package}" | grep "/${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_existAUR() {
    package="$1";
    check="$(yay -Ss "${package}" | grep "/${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalled() {
    package="$1";
    check="$(pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# `_installMany <pkg1> <pkg2> ...`
# Works the same as `_install` above,
#     but you can pass more than one package to this one.
_installMany() {
    # Normal repo packages
    toInstall=();
    # AUR packages
    toInstallAUR=();
    # Not found packages
    alreadyInstalled=();
    # Not found packages
    notFound=();

    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            #echo "${pkg} já está instalado.";
            alreadyInstalled+=("${pkg}");
        else
            if [[ $(_exist "${pkg}") == 0 ]]; then
                #echo "${pkg} existe.";
                toInstall+=("${pkg}");
            else
                if [[ $(_existAUR "${pkg}") == 0 ]]; then
                    #echo "${pkg} existe em AUR.";
                    toInstallAUR+=("${pkg}");
                else
                    echo "${pkg} não existe.";
                    notFound+=("${pkg}");
                fi
            fi
        fi
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All packages are already installed.";
    else
        echo "Installing packages: $(printf "%s " "${toInstall[@]}")"
        sudo pacman -S $(printf "%s " "${toInstall[@]}") --noconfirm --needed
    fi 

    if [[ "${toInstallAUR[@]}" == "" ]] ; then
        echo "All AUR packages are already installed.";
    else
        echo "Installing AUR packages: $(printf "%s " "${toInstallAUR[@]}")"
        for AURPKG in "${toInstallAUR[@]}"; do
            echo "Installing AUR package: $AURPKG"
            yay -S --noconfirm $AURPKG
        done
    fi
}
