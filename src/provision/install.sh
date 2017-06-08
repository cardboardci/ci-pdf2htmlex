#!/bin/sh
set -ex
cd /tmp/

# Build from source.
#
# The fontforge and pdf2htmlex need to be build from source to be installed.

apk --update --no-cache add --virtual build-dependencies libxml2 libxml2-dev alpine-sdk xz poppler-dev pango-dev m4 libtool perl autoconf automake coreutils python-dev zlib-dev freetype-dev glib-dev cmake

# fontforge
cd /tmp/
mkdir fontforge && cd fontforge
curl -sSL ${FONTFORGE_URL} | tar xfz - -C . --strip-components=1
./bootstrap --force
./configure --without-iconv
make
make install

# pdf2htmlEX
cd /tmp/
mkdir pdf2htmlex && cd pdf2htmlex
curl -sSL ${PDF2HTMLEX_URL} | tar xfz - -C . --strip-components=1
cmake . && make && make install

apk del build-dependencies

# 
# Install
#
apk --no-cache add libpng python freetype glib libintl libxml2 libxml2-dev libltdl cairo poppler pango curl make
rm -rf /tmp/* /var/tmp/* /var/cache/apk/*