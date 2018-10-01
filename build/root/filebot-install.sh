#!/bin/bash

# define pacman packages
pacman_packages="jre8-openjdk"

# install compiled packages using pacman
if [[ ! -z "${pacman_packages}" ]]; then
        pacman -S --needed $pacman_packages --noconfirm
fi

# aor packages
####

# define arch official repo (aor) packages
aor_packages=""

# call aor script (arch official repo)
source /root/aor.sh

# aur packages
####

# define aur packages
aur_packages="filebot47"

# call aur install script (arch user repo)
source /root/aur.sh