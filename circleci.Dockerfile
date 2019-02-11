FROM node:11.9.0-stretch

ARG CI_PLATFORM=
LABEL com.qima.ci-platform ${CI_PLATFORM}
LABEL org.label-schema.schema-version "1.0"
LABEL org.label-schema.name "eclint"
LABEL org.label-schema.description "eclint packaged as a docker image for circleci builds"
LABEL org.label-schema.vcs-url "https://github.com/asiainspection/docker-eclint"
LABEL org.label-schema.vendor "Qima (formerly Asia Inspection)"
LABEL org.label-schema.url "https://github.com/jedmao/eclint"
LABEL org.label-schema.docker.cmd.help "docker run --rm -v $(pwd):/app/code qima/eclint:TAG help"
LABEL org.label-schema.docker.cmd "docker run --rm -v $(pwd):/app/code qima/eclint:TAG check"

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
LABEL com.qima.version "${ECLINT_VERSION} (node/11.9.0)"
RUN npm i -g eclint@${ECLINT_VERSION}

ENTRYPOINT ["cat"]

ARG GIT_SHA1="dirty"
ARG GIT_BRANCH="dirty"
ARG CI_BUILD_NUMBER="N/A"
LABEL org.label-schema.vcs-ref ${GIT_SHA1}
LABEL com.qima.git-branch ${GIT_BRANCH}
LABEL com.qima.ci-build-number ${CI_BUILD_NUMBER}
