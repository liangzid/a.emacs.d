#!/bin/bash

echo "================================================================"
echo "                 RUNNING INSTALL PACKAGES (Arch Linux)          "
echo "================================================================"

export installList=(
    "xclip" \
    "xsel" "gdb" "w3m" "aspell" \
    "scrot" "jdk17-openjdk" "graphviz" \
    "python" "python-pipenv" \
    "mplayer" "socat" "cmake" "zsh" "ripgrep" \
    "the_silver_searcher"
)

# Dev libraries for Arch Linux
export libinstallLs=(
    "pkgconf" "glib2" \
    "openssl" "gtk3" \
    "atk" \
    "librime" \
    "libtool" \
    "mesa" \
    "freeglut" \
    "librsvg" \
    "enchant" "pkgconf"
)

sudo pacman -Syu --noconfirm

for package in "${installList[@]}"; do
    echo "-->>>SOFTWARE: installing $package..."
    sudo pacman -S --noconfirm "$package"
done

for alib in "${libinstallLs[@]}"; do
    echo "-->>>LIBRARY: installing $alib..."
    sudo pacman -S --noconfirm "$alib"
done

echo "Sleep 10s, and then config GCC/G++"
sleep 10

# Install latest GCC/G++ on Arch (already latest in repos)
sudo pacman -S --noconfirm gcc
gcc --version
g++ --version

sleep 10

echo "Installing UV (Astral.sh)"
curl -LsSf https://astral.sh/uv/install.sh | sh

# Optional: Zsh/Oh-My-Zsh setup (uncomment if needed)
# echo "================================================================"
# echo "                    Configure zsh                               "
# echo "================================================================"
# sudo pacman -S --noconfirm zsh
# cp ./.zshrc ~/.zshrc
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# echo "DONE."

# Optional: tdlib (Telegram) setup
# git clone https://github.com/tdlib/td.git
# cd td && mkdir build && cd build && cmake ../
# make -j$(nproc)
# sudo make install
