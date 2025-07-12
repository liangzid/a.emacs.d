#!/bin/bash

bash 5.add_fonts.sh

sudo pacman -S ttf-ms-fonts  # Requires enabling AUR (yay/paru)
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
