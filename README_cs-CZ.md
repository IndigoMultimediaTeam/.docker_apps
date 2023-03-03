[![LTS+sub-branches](https://img.shields.io/badge/submodule-LTS+sub--branches-informational?style=flat-square&logo=git)](https://github.com/IndigoMultimediaTeam/lts-driven-git-submodules)
# Docker kontejnery pro vývoj cordova/capacitor aplikací

## Rychlá navigace
- [Chci přidat do nové/existující appky](#přidání-do-repozitáře)
- [Co potřebuji k používání](#pozadavky)

## Používání
Dle zvolených nástrojů [docker/podman](#pozadavky) a capacitor/cordova:

### První inicializace
```bash
docker-compose build capacitor --no-cache
docker-compose build cordova --no-cache

podman-compose build capacitor --no-cache
podman-compose build cordova --no-cache
```

### Vstup do kontejneru
```bash
docker-compose run --rm capacitor bash
docker-compose run --rm cordova bash

podman-compose run --rm capacitor bash
podman-compose run --rm cordova bash
```
…uvnitř kontejneru:
```bash
npx cap …
npx cordova …
```

## Přidání do repozitáře
Přidat lze pomocí git submodulů:
```bash
git submodule add git@github.com:IndigoMultimediaTeam/.docker_apps.git
```
Jak pracovat se submoduly lze nastudovat z dokumentace [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) nebo
pomocí výcucu [`git submodule`](https://gist.github.com/jaandrle/b4836d72b63a3eefc6126d94c683e5b3).

Poté již stačí jen zvolit požadovaný `*.yml`:
```bash
cp ./.docker_apps/dapper_drake.compose.yaml ./compose.yaml
```
…a případně jej upravit dle požadavků.

## Požadavky
Kontejnery jsou kompatibilní s:
- [Docker: Accelerated, Containerized Application Development](https://www.docker.com/)
- [Podman — What is Podman?](https://docs.podman.io/en/latest/)

…postup instalace, viz:

## Docker
- Ubuntu: `sudo apt install docker docker-compose`
- Mac/Windows: [Docker Desktop](https://docs.docker.com/desktop/)
- Mac/Widows alternativně (na vlastní triko):
	- `docker`:
	- [How To Install Docker Without Docker Desktop On Windows | by Paul Knulst | Better Programming](https://betterprogramming.pub/how-to-install-docker-without-docker-desktop-on-windows-a2bbb65638a1)
	- [Docker for Mac: Homebrew Step-by-Step Tutorial | Cprime](https://www.cprime.com/resources/blog/docker-for-mac-with-homebrew-a-step-by-step-tutorial/)
	- `docker-compose`: ?
		- [Docker Desktop](https://docs.docker.com/desktop/)

## Podman
- [Podman Installation](https://podman.io/getting-started/installation)
- [containers/podman-compose](https://github.com/containers/podman-compose)
