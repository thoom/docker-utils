# docker-utils
CLI scripts to help with
[Docker Toolbox](https://www.docker.com/products/docker-toolbox),
[iTerm2](https://www.iterm2.com/),
and OS X integration.

Because they are built with OS X in mind, a few of them use Ruby.
These scripts are only meant to be used in a development environment.


## docker-exec
Ruby-based script to simplify entering the container by providing an opportunity to build
a docker exec script based on a YAML file `~/.docker-exec.yml`.

Without a YAML file, it uses an exec script similar to that provided by Kitematic.

A sample YAML file:

    env:
      term: xterm-256color
      ls_colors: rs=0:di=01;34:ln=01;36:mh=00:pi=40;33
      ls_opts: --color=auto
      ps1: '\h:\\[\e[33m\]\w\[\e[m\] \u \[\e[36m\]\\$\[\e[m\] '
    bashrc:
      - alias ls='ls --color=always'
      - alias ll='ls --color=always -lah'
    cmd:
      - cd ~
      - echo "container => $1"
      - hostname $2

A few notes:

1. Use `$1` as a placeholder for the docker tag name.
2. Use `$2` as a hostname compatible placeholder for the docker tag name.
2. __env__ is a hash that will create export the key/value pair to container's bash environment.
3. __bashrc__ is an array that will add the values to the container's `.bashrc` file.
4. __cmd__ is an array that will run the listed commands before entering the container.


## docker-iterm-dynamic-profiles
Builds a list of [Dynamic Profiles](https://www.iterm2.com/dynamic-profiles.html) in iTerm2 based on the running containers.
Used with `docker-run`, `docker-stop`, or `docker-kill` to trigger changes.

Expects a base profile called Docker to pull colors and other info from.

This file also be used to create a [LaunchAgent](http://launchd.info/) (this example assumes a 5 minute interval):

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>[YOUR PATH HERE!]</string>
        </dict>
        <key>Label</key>
        <string>com.thoomtech.dockerItermProfiles</string>
        <key>Program</key>
        <string>[PATH TO THIS FILE]/docker-iterm-dynamic-profiles</string>
        <key>RunAtLoad</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>[HOME_PATH]/Library/Logs/com.thoomtech/docker-iterm-profiles.log</string>
        <key>StandardOutPath</key>
        <string>[HOME_PATH]/Library/Logs/com.thoomtech/docker-iterm-profiles.log</string>
        <key>StartInterval</key>
        <integer>300</integer>
      </dict>
    </plist>

## docker-kill
Stops and removes a docker container.

## docker-run
Starts a docker container.

## docker-stop
Stops a docker container.
