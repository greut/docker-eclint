NAME := qima/eclint
GIT_SHA1 := $(shell git rev-parse --short HEAD)
GIT_DIRTY := $(shell git diff --quiet || echo '-dirty')
ECLINT_VERSION := $(shell cat eclint.version)
TAG := ${ECLINT_VERSION}-${GIT_SHA1}${GIT_DIRTY}
IMG := ${NAME}:${TAG}
LATEST := ${NAME}:latest

build:
	@docker image build --build-arg ECLINT_VERSION=${ECLINT_VERSION} -t ${IMG} .
	@docker image tag ${IMG} ${LATEST}

push:
	@echo "Tag ${TAG}"
ifdef GIT_DIRTY
	@echo "Cannot push a dirty image"
else
	@echo "Let's push ${IMG} (please check that you are logged in)"
	@docker image push ${IMG}
endif
