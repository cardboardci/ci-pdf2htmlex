#!/bin/sh
set -ex

pdf2htmlEX --version

for filename in *.pdf; do
    pdf2htmlEX $filename
done