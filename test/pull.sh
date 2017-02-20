#!/bin/sh
set -ex

TEST1=https://upload.wikimedia.org/wikipedia/commons/1/18/Editing_Wikipedia_brochure_EN.pdf
TEST2=https://upload.wikimedia.org/wikipedia/commons/0/05/Cheatsheet-en.pdf

curl -o test1.pdf $TEST1
curl -o test2.pdf $TEST2