#!/bin/bash
# Install js tools necessary for jenkins

# Install nodejs/npm
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get --yes --force-yes install nodejs
sudo apt-get --yes --force-yes install nodejs-legacy

# Install grunt globally
npm install -g grunt-cli