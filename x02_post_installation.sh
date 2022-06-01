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
# Generate a new SSH key, both private and public
ssh keygen
# Remove generated public key
sudo rm -rf ~/.ssh/id_rsa.pub
# Create a dev folder
mkdir ~/dev
cd ~/dev
# Add the one public SSH key that you're sharing with Github
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHmd+iaRoSRpDKwp8T82LweLQxh2ouEfl6nKefhMxstTa5b6pnqBN/hwXaRlocqxT0f5HgCZOctlzvL0reA8H+bTM2VOOlHb7K2xGgzibYAnE+YxSxlrOw7l6dsAiyCT/9Nml04x0KhM2uomvw/f0a5FScoLlrAYhNmyLrai0NVSFSR/aVlPbAocRVN02rDq6tMpKxYD8v3YVVDaU6e4SpT9WHKaXOTGaGwzhMcTnwPB1o+RuVVqd2WS3d+tmdcMru//q6v57zaqjccRCfdwYZRv/1TL/uddh4hu6BFLPBK4A/GdaVeN8FlpvJfmEE41tVCtPx21RkkPaQiYSRjqNZra7Ggue8qJngonN/dqWVp7QPygDjEzTsvmGs8QqIepxMy6HuWoQNws+1kpJ5q/QiRIV34SArPATJKG1Vj3trGVl+LwLnjjVDjfGmRNbR2AsXtHbDA5ZdL5PLpfxNDFsNLoQHwP4zenDOc7UPVo3JyYNbxRK8yyueQu/qHGl9FEU= busyneo@busychrome" > id_rsa.pub
sudo cp -r 
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

