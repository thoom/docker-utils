# docker-utils
CLI scripts to help with boot2docker, iTerm2, and OS X integration

## docker-exec
Script to simplify entering the container and setting some term coloring and aliases

## docker-iterm-dynamic-profiles
Builds a list of [Dynamic Profiles](https://www.iterm2.com/dynamic-profiles.html) in iTerm2 based on the running containers. Used with `docker-run`, `docker-stop`, or `docker-kill` to trigger changes.

Expects a base profile called Docker to pull colors and other info from.

## docker-kill
Stops and removes a docker container.

## docker-run
Starts a docker container.

##docker-stop
Stops a docker container.
