#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

./test.sh >out.txt
# sed -i -e '2,4d' -e '$d' out.txt

mdi

# 提取README.md的第一行冒号后的内容
DESCRIPTION=$(awk -F ':' 'NR==1 {print $2}' README.md | sed 's/^[ \t]*//;s/[ \t]*$//')

# 在Cargo.toml中查找并替换description字段的内容
sed -i -E "/\[package\]/,/description/ s~(description\s*=\s*\")[^\"]*~\1$DESCRIPTION~" Cargo.toml

if ! [ -x "$(command -v cargo-v)" ]; then
  cargo install cargo-v
fi
git add -u
git commit -m "."
cargo v patch -y
./clippy.sh
git pull
git push
cargo publish --registry crates-io
