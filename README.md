[![LTS+sub-branches](https://img.shields.io/badge/submodule-LTS+sub--branches-informational?style=flat-square&logo=git)](https://github.com/IndigoMultimediaTeam/lts-driven-git-submodules)
# Docker containers for cordova/capacitor application development
[Czech version](./README_cs-CZ.md).

## Quick navigation
- [I want to add to a new/existing app](#add-to-repository)
- [What I need to use](#requirements)

## Usage
According to the selected tools [docker/podman](#requirements) and capacitor/cordova:

### First initialization
```bash
docker-compose build capacitor --no-cache
docker-compose build cordova --no-cache

podman-compose build capacitor --no-cache
podman-compose build cordova --no-cache
```

### Entry into container
```bash
docker-compose run --rm capacitor bash
docker-compose run --rm cordova bash

podman-compose run --rm capacitor bash
podman-compose run --rm cordova bash
```
…inside the container:
```bash
npx cap …
npx cordova …
```

## Add to repository
It can be done using git submodules:
```bash
git submodule add git@github.com:IndigoMultimediaTeam/.docker_apps.git
```
You can learn how to work with submodules from the documentation [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) or
using the [`git submodule`](https://gist.github.com/jaandrle/b4836d72b63a3eefc6126d94c683e5b3) tutorial.

Then just select the desired `*.yml`:
```bash
cp ./.docker_apps/dapper_drake.compose.yaml ./compose.yaml
```
...and modify it as required.

## Requirements
Containers are compatible with:
- [Docker: Accelerated, Containerized Application Development](https://www.docker.com/)
- [Podman - What is Podman?](https://docs.podman.io/en/latest/)

...installation procedure, see:

## Docker
- Ubuntu: `sudo apt install docker docker-compose`
- Mac/Windows: [Docker Desktop](https://docs.docker.com/desktop/)
- Mac/Widows alternatively (on your own):
	- `docker`:
	- [How To Install Docker Without Docker Desktop On Windows | by Paul Knulst | Better Programming](https://betterprogramming.pub/how-to-install-docker-without-docker-desktop-on-windows-a2bbb65638a1)
	- [Docker for Mac: Homebrew Step-by-Step Tutorial | Cprime](https://www.cprime.com/resources/blog/docker-for-mac-with-homebrew-a-step-by-step-tutorial/)
	- `docker-compose`: ?
		- [Docker Desktop](https://docs.docker.com/desktop/)

## Podman
- [Podman Installation](https://podman.io/getting-started/installation)
- [containers/podman-compose](https://github.com/containers/podman-compose)
