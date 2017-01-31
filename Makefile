IMAGE := jrbeverly/pdf2htmlex
TAG := latest
VERSION := 1.0.0
DATE := $(shell date +%Y-%m-%d:%H:%M:%S)

build:
	docker build \
		--build-arg BUILD_DATE="${DATE}" \
		--build-arg VERSION="${VERSION}" \
		--pull -t ${IMAGE}:${TAG} .
clean:
	docker rmi --force ${IMAGE}:${TAG}
push: 
	docker push ${IMAGE}:${TAG}

rebuild: clean build
all: build