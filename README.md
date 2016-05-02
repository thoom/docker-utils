# docker-utils
CLI scripts to help with boot2docker, iTerm2, and OS X integration

## docker-exec
Script to simplify entering the container and setting some term coloring and aliases

## docker-iterm-dynamic-profiles
Builds a list of [Dynamic Profiles](https://www.iterm2.com/dynamic-profiles.html) in iTerm2 based on the running containers. Used with `docker-run`, `docker-stop`, or `docker-kill` to trigger changes.

Expects a base profile called Docker to pull colors and other info from.

This file also be used to create a LaunchAgent (this example assumes a 5 minute interval):

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

##docker-stop
Stops a docker container.
