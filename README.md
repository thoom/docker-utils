# docker-utils
CLI scripts to help with boot2docker, iterm2, and OS X integration

## docker-exec
Script to simplify entering the container and setting some term coloring and aliases

## docker-iterm-dynamic-profiles
Builds a list of [https://www.iterm2.com/dynamic-profiles.html](Dynamic Profiles) in iTerm2 based on the running containers. Used with `docker-run`, `docker-stop`, or `docker-kill` to trigger changes.

Expects a base profile called Docker to pull colors and other info from.

## docker-kill
Stops and removes a docker container.

## docker-run
Starts a docker container.

##docker-stop
Stops a docker container.
