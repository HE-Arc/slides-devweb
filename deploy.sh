#!/bin/sh

set -xe

make build/index.html

(
    cd build
    rm -f *.tmp *.md
    find . -iname "*.html" -exec sed -i "s/http%3A/https%3A/g" {} \;
    git init
    git config user.name "TravisCI"
    git config user.email "travis@he-arc.test"
    git add .
    git commit -m "Deployed to github pages"
    git push -f -q "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}" master:gh-pages
)
