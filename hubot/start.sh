#!/bin/sh

. ./.env$INSTANCE
./bin/hubot --adapter slack
