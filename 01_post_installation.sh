#!/bin/bash
# Things to do after an MX Linux installation

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

# Configure Git
git config --global user.name "iuliandonici"
git config --global user.email "iuliandonici@gmail.com"
# Initiate a git repository
# git init
# Add remote "busychrome" repository
git remote add busychrome git@github.com:iuliandonici/busychrome.git
# Add remote "neotestertheme" repository
git remote add neotestertheme git@github.com:iuliandonici/neotestertheme.git
# Clone the repositories: busychrome
git clone git@github.com:iuliandonici/busychrome.git
# Clone the repositories: neotestertheme
git clone git@github.com:iuliandonici/neotestertheme.git

# Install system components
sudo apt update  && sudo apt install -y curl gnupg apt-transport-https
# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# Register the Microsoft Product feed
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
# Install PowerShell
sudo apt update && sudo apt install -y powershell
# Start PowerShell
pwsh