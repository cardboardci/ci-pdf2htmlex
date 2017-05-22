include Makefile.app.variable
include Makefile.metadata.variable
include Makefile.image.variable

# Build Variables
#
# Variables used for the generic build
TAG ?= baseimage
USER ?= docker

# Variables
#
# Common variables of the project.
DOCKER_IMAGE := $(REGISTRY)/$(NAMESPACE)/$(PROJECT)
RELEASE_IMAGE ?= $(DOCKER_IMAGE)
IMAGE_REF ?= $(DOCKER_IMAGE):$(PREFIX_TAG)$(TAG)

# File System Variables
#
# Variables related to the file system paths.
DIRECTORY := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DIRECTORY_ROOT := $(shell dirname $(DIRECTORY))
DIRECTORY_TEST := $(shell cygpath -u $(shell dirname $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))))
DOCKER_DIR := $(DIRECTORY_ROOT)/src
DOCKERFILE := $(DOCKER_DIR)/Dockerfile

.PHONY: build baseimage privileged test debug pull push prune clean release info

all: 
	${MAKE} -s baseimage 
	${MAKE} -s privileged

# Build rules
#
# Build rules for the docker project.
build:
	docker build --pull \
		-t $(IMAGE_REF) \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${CODE_VERSION}" \
		--build-arg VCS_REF="${GIT_COMMIT}" \
		--build-arg FONTFORGE_URL="${FONTFORGE_URL}" \
		--build-arg PDF2HTMLEX_URL="${PDF2HTMLEX_URL}" \
		--build-arg USER="${USER}" \
		-f ${DOCKERFILE} ${DOCKER_DIR}/.

baseimage: TAG=baseimage
baseimage: USER=docker
baseimage: build

privileged: TAG=privileged
privileged: USER=root
privileged: build

# Testing rules
#
# Test rules for docker projects.
test:
	docker run --rm -v $(DIRECTORY_TEST)/test:/media $(IMAGE_REF) sh test_${TAG}.sh

# Generic rules
#
# Generic rules for docker projects.
debug:
	@echo Docker Image: $(IMAGE_REF)

info:
	@echo $(IMAGE_REF)

clean:
	docker rmi $(shell docker images | grep ${NAMESPACE}/${PROJECT} | tr -s ' ' | cut -d ' ' -f 3)

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

pull:
	docker pull $(IMAGE_REF)

push:
	docker push $(IMAGE_REF)

release:
	docker tag $(IMAGE_REF) $(RELEASE_IMAGE):$(TAG)
	docker push $(RELEASE_IMAGE):$(TAG)