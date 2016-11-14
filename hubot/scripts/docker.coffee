# Description:
#   Monitors docker-compose events, publish them using pubsub.
#
# Commands:
#   hubot docker ps - shows application's docker containers
#   hubot docker start/stop/restart - manage the application
#

module.exports = (robot) ->
  robot.respond /docker (.*)/i, (msg) ->
    @exec = require('child_process').exec
    command = msg.match[1]
    switch command
      when 'ps'
        msg.send "Here is what's running..."
        runCommand msg, 'cd ~/chatopslab/app/;docker-compose ps'
      when 'restart'
        msg.send "Hang tight, I'm restarting the app..."
        runCommand msg, 'cd ~/chatopslab/app/;docker-compose restart'
      when 'stop'
        msg.send "Stopping everything! :cold_sweat:"
        runCommand msg, 'cd ~/chatopslab/app/;docker-compose stop'
      when 'start'
        msg.send "Folks, start your engine! :checkered_flag:"
        runCommand msg, 'cd ~/chatopslab/app/;docker-compose start'

# Run a shell command
runCommand = (msg, cmd) ->
  @exec = require('child_process').exec
  @exec cmd, (error, stdout, stderr) ->
    if error
      msg.send error
      msg.send stderr
    else
      if !!stdout
        msg.send '```' + stdout + '```'
