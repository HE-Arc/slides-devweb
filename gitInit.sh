#!/bin/sh

set -xe

mkdir -p $1
cd $1
git init || echo "repo exists"
git config user.name "TravisCI"
git config user.email "travis@he-arc.test"
git remote add origin "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}" || echo "remote exists"
git pull origin $2
git checkout $2
if [ "${ACTION}" = "slides" ]
then
    rm -f *.html
    rm -rf css
    rm -rf js
    rm -rf fonts
elif [ "${ACTION}" = "book" ]
then
    rm -f book.pdf
elif [ "${ACTION}" = "pdfs" ]
then
    find . -name '*.pdf' ! -name 'book.pdf' -delete
fi

git add .
git commit -m "Deployed ${ACTION} to github pages" || echo "oups..."
cd ..
