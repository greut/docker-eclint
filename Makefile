NAME := qima/eclint
GIT_SHA1 := $(shell git rev-parse --short HEAD)
GIT_DIRTY := $(shell git diff --quiet || echo '-dirty')
ECLINT_VERSION := $(shell cat eclint.version)
TAG := ${ECLINT_VERSION}-${GIT_SHA1}${GIT_DIRTY}
TAG_CIRCLECI := circleci-${ECLINT_VERSION}-${GIT_SHA1}${GIT_DIRTY}
IMG := ${NAME}:${TAG}
IMG_CIRCLECI := ${NAME}:${TAG_CIRCLECI}
LATEST := ${NAME}:latest
LATEST_CIRCLECI := ${NAME}:circleci-latest

build:
	@docker image build --build-arg ECLINT_VERSION=${ECLINT_VERSION} -t ${IMG} -f exec.Dockerfile .
	@docker image tag ${IMG} ${LATEST}

build-circleci:
	@docker image build --build-arg ECLINT_VERSION=${ECLINT_VERSION} -t ${IMG_CIRCLECI} -f circleci.Dockerfile .
	@docker image tag ${IMG_CIRCLECI} ${LATEST_CIRCLECI}

push:
	@echo "Tag ${TAG}"
ifdef GIT_DIRTY
	@echo "Cannot push a dirty image"
else
	@echo "Let's push ${IMG} (please check that you are logged in)"
	@docker image push ${IMG}
endif

push-latest:
	@echo "Tag ${TAG}"
ifdef GIT_DIRTY
	@echo "Cannot push a dirty image"
else
	@echo "Let's push ${LATEST} (please check that you are logged in)"
	@docker image push ${LATEST}
endif

push-circleci:
	@echo "Tag ${TAG}"
ifdef GIT_DIRTY
	@echo "Cannot push a dirty image"
else
	@echo "Let's push ${IMG_CIRCLECI} (please check that you are logged in)"
	@docker image push ${IMG_CIRCLECI}
endif

push-circleci-latest:
	@echo "Tag ${TAG}"
ifdef GIT_DIRTY
	@echo "Cannot push a dirty image"
else
	@echo "Let's push ${LATEST_CIRCLECI} (please check that you are logged in)"
	@docker image push ${LATEST_CIRCLECI}
endif
