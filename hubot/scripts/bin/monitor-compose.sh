#!/bin/sh

cd ~/chatopslab/app

docker-compose events | \
while read line ; do
  action=`echo $line | awk '{print $4}'`
  name=`echo $line | grep -oP 'name=\K\w+'`
  case $action in
    kill)
      echo $name "killed"
      ;;
    die)
      echo $name "died"
      ;;
    stop)
      echo $name "stopped"
      ;;
    start)
      echo $name "started"
      ;;
    restart)
      echo $name "restarted"
      ;;
    attach)
      echo $name "attached"
      ;;
    *)
      echo "Unknown action: " $action
  esac
done
