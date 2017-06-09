#!/bin/sh

# Tests
#
# A set of common functions that should be tested on the docker image.

install()
{
    apk add --no-cache zip >/dev/null 2>&1
}

version()
{
    pdf2htmlEX --version >/dev/null 2>&1
}

single_pdf()
{
    mydir="${DIR_TARGET}/simple_pdf"
    mkdir -p $mydir

    curl -o "${mydir}/simple_pdf.pdf" "https://upload.wikimedia.org/wikipedia/commons/0/05/Cheatsheet-en.pdf" >/dev/null 2>&1
    pdf2htmlEX --dest-dir "${mydir}" "${mydir}/simple_pdf.pdf" >/dev/null 2>&1
}

multi_pdf()
{
    mydir="${DIR_TARGET}/multi_pdf"
    mkdir -p $mydir

    curl -o "${mydir}/multi_pdf.pdf" "https://upload.wikimedia.org/wikipedia/commons/1/18/Editing_Wikipedia_brochure_EN.pdf" >/dev/null 2>&1
    pdf2htmlEX --dest-dir "${mydir}" "${mydir}/multi_pdf.pdf" >/dev/null 2>&1
}

graphics_pdf()
{
    mydir="${DIR_TARGET}/graphics_pdf"
    mkdir -p $mydir

    curl -o "${mydir}/graphics_pdf.pdf" "https://upload.wikimedia.org/wikipedia/commons/3/37/Detection_distribution.pdf" >/dev/null 2>&1
    pdf2htmlEX --dest-dir "${mydir}" "${mydir}/graphics_pdf.pdf" >/dev/null 2>&1
}
