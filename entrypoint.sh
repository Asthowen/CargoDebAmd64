#!/bin/sh -l
set -eux

# Taken from https://github.com/zhxiaogg/cargo-static-build, unsure if all needed or not

ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

cd $GITHUB_WORKSPACE
sh -c "$*"
chmod 0777 ./target