#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

name=$(basename $DIR)

curl -H "Authorization: token $GITHUB_TOKEN" -X POST \
  -H "Accept: application/vnd.github+json" -d '{"name":"'$name'","private":false}' \
  https://api.github.com/orgs/xxai-art/repos

fd --type file --exec sd 'xwarn' $name
sed -i "s/xwarn/$name/g" .git/config

mv envrc .envrc

mv .git/config /tmp
rm -rf .git
git init
mv /tmp/config .git
git add .
git add -u
git commit -m'init'
git push origin main

direnv allow &

rm -rf $0
