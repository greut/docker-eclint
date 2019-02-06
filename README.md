# Docker EditorConfig / eclint

## What?

This is a repository to maintain the Dockerfile for image [qima/eclint](https://cloud.docker.com/u/qima/repository/docker/qima/eclint),
A Docker Image to run [editorconfig](http://editorconfig.org/) checks using [eclint](https://github.com/jedmao/eclint)

## Usage
To use you have to simply have a `.editorconfig` file in the root of your project and run:

```bash
docker run --rm -v $(pwd):/app/code qima/eclint check
# or in a git repository, in order to honor a .gitconfig file
docker run --rm -v $(pwd):/app/code qima/eclint check $(git ls-files)
```

That will pull down the `qima/eclint` image from dockerhub, then run the `check` command from eclint.

The `--rm` option is used to remove the container when the command is done executing and the `-v $(pwd):/app/code` option will take your current directory and share it as a volume within the container (so make sure you run the docker from the root of your project).

## CircleCI

If you want to use this image with [CircleCI](https://circleci.com/) you can use `qima/eclint:circleci-latest` (or one of the sha1 versions matching the master branch)

## Thanks

Inspired by [odannyc/eclint](https://hub.docker.com/r/odannyc/eclint) and [github.com/odannyc/docker-eclint](https://github.com/odannyc/docker-eclint)

Node and eclint versions are fixed (i.e no `latest`)
