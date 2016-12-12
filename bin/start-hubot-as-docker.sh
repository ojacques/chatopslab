#$!/bin/bash

sudo docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$http_proxy -t hubotchatlab:0.1 .

if [ "$1" != "" ]
then
   INSTANCE_FLAG="-e INSTANCE=$1"
fi

if [ "$(docker ps -a --format '{{ .Names }}' -f name=hubot)" != "" ]
then
   sudo docker rm -f hubot
fi

sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock -p 8888:8888 -e DOOD_PWD=$(pwd)/app $INSTANCE_FLAG -d --name hubot hubotchatlab:0.1
