FROM node:11.9.0-stretch

LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.name = "eclint"
LABEL org.label-schema.description = "eclint packaged as a docker image"
LABEL org.label-schema.vcs-url = "https://github.com/asiainspection/docker-eclint"
LABEL org.label-schema.vendor = "Qima (formerly Asia Inspection)"
LABEL org.label-schema.url="https://github.com/jedmao/eclint"
LABEL org.label-schema.version = "2.8.1-01 (node/11.9.0)"
LABEL org.label-schema.docker.cmd.help = "docker run --rm -v $(pwd):/app/code qima/eclint help"
LABEL org.label-schema.docker.cmd = "docker run --rm -v $(pwd):/app/code qima/eclint check"

WORKDIR /app/code

RUN apt-get update && \
  apt-get install -y \
  netcat \
  git \
  ssh \
  tar \
  gzip \
  ca-certificates
ARG ECLINT_VERSION
RUN npm i -g eclint@${ECLINT_VERSION}

ENTRYPOINT ["cat"]
