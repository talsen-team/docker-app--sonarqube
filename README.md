# docker-app: sonarqube

[![Docker Automated build](https://img.shields.io/docker/automated/talsenteam/docker-sonarqube.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube/)
[![Docker Pulls](https://img.shields.io/docker/pulls/talsenteam/docker-sonarqube.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube/)
[![Docker Build Status](https://img.shields.io/docker/build/talsenteam/docker-sonarqube.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube/)

The server application sonarqube ready to run inside a docker container.

[![Docker Automated build](https://img.shields.io/docker/automated/talsenteam/docker-sonarqube-database.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube-database/)
[![Docker Pulls](https://img.shields.io/docker/pulls/talsenteam/docker-sonarqube-database.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube-database/)
[![Docker Build Status](https://img.shields.io/docker/build/talsenteam/docker-sonarqube-database.svg?style=for-the-badge)](https://hub.docker.com/r/talsenteam/docker-sonarqube-database/)

An utility application for sonarqube ready to run inside a docker container.

## how to use

To easily experiment with sonarqube, the following pre-requisites are preferred:

1. Install [VS Code](https://code.visualstudio.com/), to easily use predefined [tasks](.vscode/tasks.json)
2. Install any [ssh-askpass](https://man.openbsd.org/ssh-askpass.1) to handle sudo prompts required for docker  
   (VS Code does not run as root user, so in order to perform sudo operations the [`sudo --askpass CMD`](bash/util/elevate.sh) feature is used)
3. Install docker (at least version 18.09.1, build 4c52b90)
4. Install docker-compose (at least version 1.21.2, build a133471)

Then open the cloned repository directory with VS Code and use any of the custom tasks.

## custom VS Code tasks

Any docker-compose--* tasks refer to the default dockerfile [sonarqube](docker/server--sonarqube/default.docker) and [sonarqube-database](docker/server--sonarqube-database/default.docker) as well as to the [docker-compose](docker-compose/server--sonarqube/default.docker-compose) configuration if required for command execution.

- browser--*
  - [browser--open-application-url](bash-commands/browser--open-application-url.sh)  
    Opens the localhost docker service URL in the default web-browser. The opened URL is defined in [host.env](host.env) by the variable HOST_SERVICE_URL.
- docker-compose--*
  - docker-compose--compose--*
    - [docker-compose--compose--create](bash-commands/docker-compose--compose--create.sh)  
      Creates required docker containers and docker networks but does not start them.
    - [docker-compose--compose--down](bash-commands/docker-compose--compose--down.sh)  
      Stops and removes required docker containers and docker networks.
    - [docker-compose--compose--up](bash-commands/docker-compose--compose--up.sh)  
      Creates and starts required docker containers and docker networks.
  - docker-compose--container--*
    - [docker-compose--container--kill](bash-commands/docker-compose--container--kill.sh)  
      Kills all running containers declared by the compose configuration.
    - [docker-compose--container--restart](bash-commands/docker-compose--container--restart.sh)  
      Restarts all containers declared by the compose configuration (if they were created before).
    - [docker-compose--container--start](bash-commands/docker-compose--container--start.sh)  
      Starts all containers declared by the compose configuration (if they were created before).
    - [docker-compose--container--stop](bash-commands/docker-compose--container--stop.sh)  
      Stops all running containers declared by the compose configuration.
  - docker-compose--image--*
    - [docker-compose--image--build](bash-commands/docker-compose--image--build.sh)  
      Builds all required docker images referenced by the compose configuration (using build cache).
    - [docker-compose--image--rebuild](bash-commands/docker-compose--image--rebuild.sh)  
      Builds all required docker images referenced by the compose configuration (without using build cache).
  - docker-compose--log--*
    - [docker-compose--log--container-info](bash-commands/docker-compose--log--container-info.sh)  
      Prints general conntainer informations regarding the compose configuration to the console.
    - [docker-compose--log--container-log](bash-commands/docker-compose--log--container-log.sh)  
      Prints logs of running containers declared by the compose configuration to the console.
  - docker-compose--system--*
    - [docker-compose--system--clean](bash-commands/docker-compose--system--clean.sh)  
      Removes local dangling docker containers, images and networks.
    - [docker-compose--system--prune](bash-commands/docker-compose--system--prune.sh)  
      Prunes the local docker system.
  - docker-compose--volumes--*
    - [docker-compose--volumes--wipe-local](bash-commands/docker-compose--volumes--wipe-local.sh)  
      Wipes local volume mapping directories, located in the subdirectory 'volumes/', if there are any.
- git--*
  - [git--pull-and-update-submodules](bash-commands/git--pull-and-update-submodules.sh)  
    Rebase pulls the latest repository changes and the updates all git submodules if there are any.
