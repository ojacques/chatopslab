#!/bin/bash

git clone https://github.com/ojacques/chatopslab.git

which curl docker make ruby || {
  sudo apt-get update
  sudo apt-get install -y curl docker.io make ruby
  sudo usermod -a -G docker ubuntu
  sudo gem install rubyzip
}

which docker-compose || {
  curl -sSL https://github.com/docker/compose/releases/download/1.9.0-rc2/docker-compose-`uname -s`-`uname -m` > docker-compose
  sudo mv docker-compose /usr/local/bin
  sudo chmod +x /usr/local/bin/docker-compose
}

which npm || {
  sudo apt-get install nodejs
  sudo apt-get install nodejs-legacy
  sudo apt-get install npm
}

which yo || {
  cd ~/chatopslab
  mkdir hubot && cd hubot
  sudo npm install -g yo generator-hubot
}

cd ~chatopslab/app
echo "Waiting for Docker daemon to start"
sleep 5
docker-compose create

