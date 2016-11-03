#!/bin/bash

which curl docker make ruby || {
  sudo apt-get update
  sudo apt-get install -y curl docker.io make ruby
  sudo usermod -a -G docker ubuntu
  sudo gem install rubyzip
}

which docker-compose || {
  curl -sSL https://github.com/docker/compose/releases/download/1.9.0-rc2/docker-compose-`uname -s`-`uname -m` > docker-compose
  sudo cp docker-compose /usr/local/bin
  sudo chmod +x /usr/local/bin/docker-compose
}

git clone https://github.com/ojacques/chatopslab.git
cd chatopslab/compose
docker-compose build
