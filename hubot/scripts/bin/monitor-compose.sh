#!/bin/sh

cd ~/chatopslab/app

docker-compose events | \
while read line ; do
  action=`echo $line | awk '{print $4}'`
  name=`echo $line | grep -oP 'name=\K\w+'`
  message=""
  case $action in
    kill)
      message=""
      ;;
    die)
      message=""
      ;;
    stop)
      message=":heavy_exclamation_mark::whale: Docker container *$name* stopped" 
      ;;
    start)
      message=":white_check_mark::whale: Docker container *$name* started"
      ;;
    restart)
      message=":white_check_mark::whale: Docker container *$name* restarted" 
      ;;
    attach)
      message=":white_check_mark::whale: Docker container *$name* attached" 
      ;;
    *)
      message=""
  esac

  if [ ! -z "$message" ]; then
    curl -H "Content-Type: application/json" -X POST -d '{ "event": "docker", "data": "'"${message}"'" }' http://localhost:8888/publish
  fi
done
