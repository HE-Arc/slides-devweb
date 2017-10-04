#!/bin/sh

set -xe

if [ "${ACTION}" = "slides" ]
then
    make $1/index.html
fi
(
    cd $1
    git pull
    rm -f *.tmp *.md
    git add .
    git commit -m "Deployed ${ACTION} to github pages" || echo "oups..."
    git push || echo "oups..."
)
