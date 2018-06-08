#!/bin/sh

WRK_DIR=$(pwd)/$(dirname "$0")
echo "using platform \"common\""
PLATFORMS="common"

case $(uname) in
  Darwin)
    echo "found platform \"macos\""
    PLATFORMS=$PLATFORMS" macos"
    ;;
  Linux)
    echo "found platform \"linux\""
    PLATFORMS=$PLATFORMS" linux"
    ;;
esac

echo "creating directories for fish shell"
mkdir -pv ~/.config/fish/functions ~/.config/fish/conf.d

for PLATFORM in $PLATFORMS
do
  cd "$WRK_DIR"/"$PLATFORM"
  for PKG_DIR in ./*
  do
    PKG_NAME=$(basename $PKG_DIR)
    echo "creating symlinks for \"$PKG_NAME\""
    stow --restow --verbose --target=$HOME $PKG_NAME
  done
done

echo "done."