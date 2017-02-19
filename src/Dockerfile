FROM alpine:3.5
MAINTAINER jrbeverly

# Build Arguments
#
# Arguments used in the build process of the docker container.
ARG FONTFORGE_URL
ARG PDF2HTMLEX_URL

# Environment Variables
#
# Environment variables present in the docker container.
ENV HOME=/
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig/

# Provision
#
# Copy and execute provisioning scripts of the docker container.
COPY provision/install /tmp/install
RUN sh /tmp/install && rm -f /tmp/install

COPY provision/install-lib /tmp/install-lib
RUN sh /tmp/install-lib && rm -f /tmp/install-lib

# Volumes
#
# Volumes exposed by the docker container.
VOLUME /media

# Options
#
# Configuration options of the docker container.
WORKDIR /media
ENTRYPOINT []
CMD []

# User Arguments
#
# Arguments used in the user process of the docker container.
ARG DUID
ARG DGID
ARG USER

# User
#
# Configuration of the docker user for container execution.
RUN addgroup -g ${DGID} -S docker && adduser -S -G docker -u ${DUID} docker
USER ${USER}

# Metadata Arguments
#
# Arguments used in the build process of the docker container.
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

# Metadata 
#
# The metadata of the image.
LABEL \
    org.label-schema.name="pdf2htmlEX" \
    org.label-schema.description="pdf2htmlEX renders PDF files in HTML, utilizing modern Web technologies." \
    org.label-schema.url="https://github.com/coolwanglu/pdf2htmlEX" \
    org.label-schema.vendor="coolwanglu" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.license="MIT" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-pdf2htmlEX.git" \
    org.label-schema.ci-build-url="https://gitlab.com/jrbeverly-docker/docker-pdf2htmlEX/commits/master" \
    org.label-schema.version="${VERSION}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    io.gitlab.jrbeverly.user="${DUID}" \
    io.gitlab.jrbeverly.group="${DGID}" \