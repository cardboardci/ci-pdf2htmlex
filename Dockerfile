FROM alpine:3.5
MAINTAINER jrbeverly

# Environment Variables
#
# Environment variables present in the docker container.
ENV HOME=/
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig/

# Provision
#
# Copy and execute provisioning scripts of the docker container.
COPY provision/install /tmp/install
RUN sh /tmp/install && rm -rf /tmp/*

COPY provision/install-lib /tmp/install-lib
RUN sh /tmp/install-lib && rm -f /tmp/install-lib

# Volumes
#
# Volumes exposed by the docker container
VOLUME /media

# Options
#
# Configuration options of the docker container
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

# Metadata 
#
# The metadata of the image.
LABEL app="pdf2htmlEX"
LABEL description="pdf2htmlEX renders PDF files in HTML, utilizing modern Web technologies."
LABEL version="${VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL user="${DUID}"
LABEL group="${DGID}"