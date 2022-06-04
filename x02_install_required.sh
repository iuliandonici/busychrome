#!/bin/bash
# Things to do after an MX Linux installation

# Generate a new SSH key, both private and public
ssh-keygen

# Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y --purge
sudo apt-get update

# Install VS Codium
# - Add the GPG key of the repository:
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
# - Add the repository
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
# - Finally, install VS Codium
sudo apt update && sudo apt install codium -y

# Add VS Codium to startup applications
# - Create a dev folder
mkdir dev
cd dev/
# - Make a .desktop file
echo -e "[Desktop Entry]\n Name=VSCodium_at_startup\n Type=Application\n Exec=/usr/share/codium/codium dev/ \n Terminal=false" > test.desktop
# - Copy it to the autostart folder
sudo cp -r test.desktop /etc/xdg/autostart/VS_Codium_autostart.desktop
# - Remove it from the local folder
rm -rf test.desktop

# Install system components
sudo apt update  && sudo apt install -y curl gnupg apt-transport-https

# Install PowerShell
# - Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# - Register the Microsoft Product feed
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
# - Actually install PowerShell
sudo apt update && sudo apt install -y powershell
# Start PowerShell
# pwsh

#  Install Brave browser
# - Get the keys
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
# - Add the repository to ours
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# - Actually install Brave
sudo apt update
sudo apt install brave-browser -y

# Update everything again
sudo apt-get update 
sudo apt-get upgrade -y