#$!/bin/bash

sudo docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$http_proxy -t hubotchatlab:0.1 .

sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm hubotchatlab:0.1
