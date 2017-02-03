<div align="center">
  <img alt="Dockerized Pdf2HtmlEX" src="./icon.png" width="200px" height="200px" />
  <br/>
  <h1>Dockerized Pdf2HtmlEX</h1>
</div>

<p align="center">
  Pdf2htmlEX renders PDF files in HTML, utilizing modern Web technologies.
</p>

<div align="center">
  <a href="/../commits/master"><img alt="Build Status" src="/../badges/master/build.svg" /></a>
  <a href="/../blob/master/LICENSE"><img alt="License" src="https://img.shields.io/badge/license-MIT-blue.svg?maxAge=2592000" /></a>
  <a href="https://alpinelinux.org/posts/Alpine-3.3.0-released.html"><img alt="Base image" src="https://img.shields.io/badge/alpine-3.3-green.svg?maxAge=2592000" /></a>
</div>
<br/>

## Abstract

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
  image: jrbeverly/pdf2htmlEX
  script:
    - pdf2htmlEX --zoom 1.8 report.pdf
  artifacts:
    paths:
      - index.html
```

## Components
### Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| BUILD_DATE | - | The date which the image was built. |
| VERSION | - | The version of the image. |

### Environment Variables

Environment variables used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| HOME | / | The pathname of the user's home directory. |

### Volumes

Volumes exposed by the docker container.

| Volume | Description |
| ------ | ----------- |
| /media | The directory containing the pdf to convert. |

## Build Process

To build the docker image, use the included makefile.

```
make build
```

You can also build the image manually, but it is recommended to use the makefile.

```
docker build \
		--build-arg BUILD_DATE="$(date)" \
		--build-arg VERSION="${VERSION}" \
		--pull -t ${IMAGE}:${TAG} .
```