#!/bin/sh

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
  echo "Usage: $0 PATH_TO_DOTFILES_DIR" >&2
  exit 1
fi

DOTDIR="$1"

case $(uname) in
   Darwin)
      ln -sf $DOTDIR/code/User.symlink/keybindings/macos.symlink $DOTDIR/code/User.symlink/keybindings.json
      ln -sf $DOTDIR/code/User.symlink/settings/macos.symlink $DOTDIR/code/User.symlink/settings.json
      ln -sf $DOTDIR/code/User.symlink ~/Library/Application\ Support/Code/User
      ;;
   Linux)
      ln -sf $DOTDIR/code/User.symlink/keybindings/linux.symlink $DOTDIR/code/User.symlink/keybindings.json
      ln -sf $DOTDIR/code/User.symlink/settings/linux.symlink $DOTDIR/code/User.symlink/settings.json
      ln -sf $DOTDIR/code/User.symlink ~/.config/Code/User
      ;;
esac

ln -sf $DOTDIR/fish/fish.symlink ~/.config/fish
ln -sf $DOTDIR/git/gitconfig.symlink ~/.gitconfig
ln -sf $DOTDIR/npm/npmrc.symlink ~/.npmrc
ln -sf $DOTDIR/nvim/nvim.symlink ~/.config/nvim
ln -sf $DOTDIR/vifm/vifm.symlink ~/.config/vifm
