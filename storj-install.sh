#!/bin/bash

# Remove firewall or open port 4000
sudo ufw disable
# Update
sudo apt update -y && apt dist-upgrade -y
# Install snap
sudo apt install snap
# Install storjshare with snap
sudo snap install storjshare
# Install nodejs
sudo apt install nodejs-legacy -y
# NVM configuration
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This load$
sudo nvm install --lts
sudo nvm install 8.6.0
# Update
sudo apt update -y && apt dist-upgrade -y
# Install gitn python and build-essential
sudo apt-get install git python build-essential -y
# Here, we create the folder to store the data
mkdir /root/storj
# Install storjshare-daemon
sudo npm install --global storjshare-daemon
# Create your node, you should replace the wallet address, the folder storage that you create before, the size of the node and where you save the configuration file
storjshare create --storj 0xAfA94c5ac3F38Ee4bCde92F160F7b4738ACEd0F5 --storage /root/storj --size 16GB --outfile /root/config.json
# Open the configuration file to change the IP of your server
vim /root/config.json
# Run the daemon
storjshare daemon
# Start the node with the configuration file
storjshare start --config /root/config.json
