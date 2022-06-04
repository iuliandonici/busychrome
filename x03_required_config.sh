#!/bin/bash

# Create a dev folder
mkdir dev
cd dev/

# Configure git
# - Set global user
git config --global user.name "iuliandonici"
git config --global user.email "iuliandonici@gmail.com"
# - Initiate a git repository
git init
# - Clone the repositories: busychrome
git clone git@github.com:iuliandonici/busychrome.git
# - Clone the repositories: neotestertheme
git clone git@github.com:iuliandonici/neotestertheme.git
# Add remote "busychrome" repository
git remote add busychrome git@github.com:iuliandonici/busychrome.git
# - Add remote "neotestertheme" repository
git remote add neotestertheme git@github.com:iuliandonici/neotestertheme.git

# Add VS Codium to startup applications
# - Make a .desktop file
echo -e "[Desktop Entry]\n Name=VSCodium_at_startup\n Type=Application\n Exec=/usr/share/codium/codium dev/ \n Terminal=false" > test.desktop
# - Copy it to the autostart folder
sudo cp -r test.desktop /etc/xdg/autostart/VS_Codium_autostart.desktop
# - Remove it from the local folder
rm -rf test.desktop
