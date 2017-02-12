# Dockerized Pdf2HtmlEX
[![MIT License][license-badge]][license][![Alpine][alpine-badge]][alpine]

## Summary

[Pdf2htmlEX](https://github.com/coolwanglu/pdf2htmlEX) renders PDF files in HTML, utilizing modern Web technologies.

## Usage

You can use this image locally with `docker run`, calling [`pdf2htmlEX`](https://github.com/coolwanglu/pdf2htmlEX/wiki/Quick-Start) as such:

```console
docker run -v /media:/media jrbeverly/pdf2htmlex pdf2htmlEX report.pdf
```

### Gitlab
You can add a build job with `.gitlab-ci.yml`

```yaml
compile_pdf:
  image: jrbeverly/pdf2htmlex
  script:
    - pdf2htmlEX --zoom 1.8 report.pdf
  artifacts:
    paths:
      - index.html
```

You can use either the latest image with a root user, or the image `jrbeverly/pdf2htmlex:locked` to use a non-root user.

## Image Tags

Build tags available with the image `jrbeverly/pdf2htmlex:{TAG}`.

| Tag | Status | Description |
| --- | ------ | ----------- |
| [latest](/../tree/latest) | [![build status](/../badges/latest/build.svg)](/../commits/latest) | An alpine image with pdf2htmlEX installed. |
| [locked](/../tree/locked) | [![build status](/../badges/locked/build.svg)](/../commits/locked) | An alpine image with pdf2htmlEX installed using non-root. |

## Components
### Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| BUILD_DATE | see [Makefile](Makefile.image.variable) | The date which the image was built. |
| VERSION | see [Makefile](Makefile.image.variable) | The version of the image. |
| DUID | see [Makefile](Makefile.image.variable) | The [user id](http://www.linfo.org/uid.html) of the docker user. |
| DGID | see [Makefile](Makefile.image.variable) | The [group id](http://www.linfo.org/uid.html) of the docker user's group. |

### Environment Variables

Environment variables used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| HOME | / | The pathname of the user's home directory. |

### Volumes

Volumes exposed by the docker container.[^1]

| Volume | Description |
| ------ | ----------- |
| /media | The directory containing the pdf to convert. |

## Build Process

To build the docker image, use the included makefile.

```
make build
```

You can also build the image manually, but it is recommended to use the makefile to ensure all build arguments are provided.

```
docker build \
		--build-arg BUILD_DATE="$(date)" \
		--build-arg VERSION="${VERSION}" \
		--pull -t ${IMAGE}:${TAG} .
```

## User and Group Mapping

All processes within the docker container will be run as the **docker user**, a non-root user.  The **docker user** is created on build with the user id `DUID` and a member of a group with group id `DGID`.  

Any permissions on the host operating system (OS) associated with either the user (`DUID`) or group (`DGID`) will be associated with the docker container.  The values of `DUID` and `DGID` are visible in the [Build Arguments](#Build-Arguments), and can be accessed by the the command:

```console
docker inspect -f '{{ index .Config.Labels "user" }}' $IMAGE
docker inspect -f '{{ index .Config.Labels "group" }}' $IMAGE
```

The notation of the build variables is short form for docker user id (`DUID`) and docker group id (`DGID`). 

[^1]: It is necessary to ensure that the **docker user** (`DUID`) has permission to access volumes. (see [User / Group Identifiers](#User-and-Group-Mapping)

[license-badge]: https://img.shields.io/badge/license-MIT-blue.svg?maxAge=2592000
[license]: /../blob/master/LICENSE
[alpine-badge]: https://img.shields.io/badge/alpine-3.5-green.svg?maxAge=2592000
[alpine]: https://alpinelinux.org/posts/Alpine-3.5.0-released.html