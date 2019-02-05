# Docker EditorConfig / eclint

## What?

This is a repository to maintain the Dockerfile for image [qima/eclint](https://cloud.docker.com/u/qima/repository/docker/qima/eclint).

Inspired by [odannyc/eclint](https://hub.docker.com/r/odannyc/eclint) and [github.com/odannyc/docker-eclint](https://github.com/odannyc/docker-eclint)

Node and eclint versions are fixed (i.e no `latest`)

## How?

- run `make build` to build the image
- run `make push` to push. No push will happen if git workdir is in a dirty state.
