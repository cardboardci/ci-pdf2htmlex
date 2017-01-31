FROM alpine:3.3
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
RUN sh /tmp/install; sync; rm -rf /tmp/*

COPY provision/install-lib /tmp/install-lib
RUN sh /tmp/install-lib; sync; rm -f /tmp/install-lib

# Volumes
#
# Volumes exposed by the docker container
VOLUME /media

# Options
#
# Configuration options of the docker container
WORKDIR /media

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