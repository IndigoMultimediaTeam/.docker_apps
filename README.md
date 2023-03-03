# Docker kontejnery pro vývoj cordova/capacitor aplikací

## TODO
- git submoduly:
  - `git submodule add git@github.com:IndigoMultimediaTeam/.docker_apps.git`
  - [`git submodule`](https://gist.github.com/jaandrle/b4836d72b63a3eefc6126d94c683e5b3)
  - [IndigoMultimediaTeam/lts-driven-git-submodules](https://github.com/IndigoMultimediaTeam/lts-driven-git-submodules)
- docker/podman
  - [Docker: Accelerated, Containerized Application Development](https://www.docker.com/)
  - [Introduction — Podman documentation](https://docs.podman.io/en/latest/Introduction.html)
- docker-compose/podman-compose
  - [Docker Compose overview](https://docs.docker.com/compose/)
  - [containers/podman-compose](https://github.com/containers/podman-compose)

```bash
cp ./.docker_apps/dapper_drake.compose.yaml ./compose.yaml
# 1
docker-compose build
docker-compose run --rm capacitor bash
# 2
podman-compose build
podman-compose run --rm capacitor bash
```
