FROM alpine:3.6

#
# Build Arguments
#
ARG FONTFORGE_URL
ARG PDF2HTMLEX_URL

#
# Environment Variables
#
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig/

#
# Provision
#
COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

# 
# Options
# 
WORKDIR /media
ENTRYPOINT []
CMD []

#
# User
#
ARG USER
USER $USER

#
# Metadata Arguments
#
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

#
# Metadata
#
LABEL \
    maintainer="jrbeverly" \
    \
    org.label-schema.name="pdf2htmlEX" \
    org.label-schema.summary="A super small Alpine image with pdf2htmlEX installed." \
    org.label-schema.description="pdf2htmlEX renders PDF files in HTML, utilizing modern Web technologies." \
    org.label-schema.maintainer="jrbeverly" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.version=$VERSION \
    org.label-schema.url="https://github.com/coolwanglu/pdf2htmlEX" \
    org.label-schema.license="MIT" \
    org.label-schema.docker.cmd="docker run -v $(pwd):/media/ jrbeverly/pdf2htmlex:privileged pdf2htmlEX --zoom 1.8 report.pdf" \
    org.label-schema.vendor="jrbeverly" \
    org.label-schema.schema-version="1.0" \
    \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-pdf2htmlEX" \
    \
    org.doc-schema.project="pdfhtmlex" \
    org.doc-schema.summary="A docker image with pdf2htmlEX installed, running as the $USER user." \
    org.doc-schema.user=$DUID \
    org.doc-schema.group=$DGID