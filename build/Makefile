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
DOCKER_IMAGE := ${REGISTRY}/${NAMESPACE}/${PROJECT}
RELEASE_IMAGE ?= $(DOCKER_IMAGE)
IMAGE_REF ?= $(DOCKER_IMAGE):$(PREFIX_TAG)$(TAG)

# File System Variables
#
# Variables related to the file system paths.
DIRECTORY := $(shell cygpath -u $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
DIRECTORY_ROOT := $(shell dirname $(DIRECTORY))
DOCKER_DIR := $(DIRECTORY_ROOT)/src
DOCKERFILE := $(VERSIONS)/$(VERSION)/Dockerfile

.PHONY: build baseimage privileged test debug pull push prune clean  

all: 
	${MAKE} -s baseimage 
	${MAKE} -s privileged

release: 
	${MAKE} -s debug 
	${MAKE} -s baseimage 
	${MAKE} -s privileged
	${MAKE} -s push

# Build rules
#
# Build rules for the docker project.
build:
	docker build --pull \
		-t ${DOCKER_IMAGE}:$(TAG) \
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
	docker run --rm -v $(DIRECTORY_ROOT)/test:/media ${DOCKER_IMAGE}:${TAG} sh test_${TAG}.sh

# Generic rules
#
# Generic rules for docker projects.

debug:
	@echo Docker Image: $(DOCKER_IMAGE)
	@echo $(DIRECTORY)

#BAR := /cygdrive/c/foo/bar
#WIN_BAR := $(shell cygpath -w ${BAR})

pull:
	docker pull --all-tags ${DOCKER_IMAGE}

push:
	docker push ${DOCKER_IMAGE}

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

clean:
	docker rmi --force ${DOCKER_IMAGE}:baseimage ${DOCKER_IMAGE}:privileged || exit 0