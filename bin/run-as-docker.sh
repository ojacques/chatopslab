#$!/bin/bash

sudo docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$http_proxy -t hubotchatlab:0.1 .

if [ "$1" != "" ]
then
   INSTANCE_FLAG="-e INSTANCE=$1"
fi

sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock -e DOOD_PWD=$(pwd) $INSTANCE_FLAG --rm hubotchatlab:0.1
