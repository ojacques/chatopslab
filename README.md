# chatopslab
Get started with ChatOps: an hands on set of steps

# Starting services

## hubot

### setup .env file

- Get a bot user and SLACK token at https://my.slack.com/services/new/bot
- Create an .env file

```
cp hubot/.env.template hubot/.env
vi hubot/.env
```

### Start it

- Start hubot
```bash
$ bin/start_hubot_as_docker.sh
```

This command will build a docker image and start it.


- Start the docker-compose monitoring
```
hubot/scripts/bin/monitor-compose.sh
```

TODO: Move it in the hubot container...

- In chat, subscribe to "docker" events
```
@mybot subscribe docker
```

- Run commands
![dockercomposeps.jpg](/img/dockercomposeps.jpg)


For details about the bot. check it [here](hubot/README.md)


## app

### Start the Application from the bot

Open the slack chat
type `@mybot docker start`

Replace `mybot` to your bot name if needed.

For details about the Application, check it [here](app/README.md)

