FROM jrbeverly/baseimage:alpine-3.5

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
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-pdf2htmlEX" \
    org.label-schema.docker.cmd="docker run -v /media/:/media/ jrbeverly/pdf2htmlex pdf2htmlEX report.pdf" \
    \
    io.jrbeverly.project="pdfhtmlex" \
    io.jrbeverly.summary="A docker image with pdf2htmlEX installed, running as the $USER user." \
    io.jrbeverly.pdfhtmlex.meta.BUILD_DATE="The Date/Time the image was built." \
    io.jrbeverly.pdfhtmlex.meta.VERSION="Release identifier for the contents of the image." \
    io.jrbeverly.pdfhtmlex.meta.VCS_REF="Identifier for the version of the source code from which this image was built." \
    io.jrbeverly.pdfhtmlex.args.USER="Sets the [user](http://www.linfo.org/uid.html) to use when running the image." \
    io.jrbeverly.pdfhtmlex.args.FONTFORGE_URL="The URL to the fontforge source zip." \
    io.jrbeverly.pdfhtmlex.args.PDF2HTMLEX_URL="The URL to the pdf2htmlex source zip." \
    io.jrbeverly.pdfhtmlex.volume.media="/media/|The default working directory of the image." 
