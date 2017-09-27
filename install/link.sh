#!/bin/sh

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
   echo "Usage: $0 PATH_TO_DOTFILES_DIR" >&2
   exit 1
fi

# get location of dotfiles directory from first argument
DOTDIR="$1"

# ==== link files in macOS/Linux-specific directories ====
case $(uname) in
   Darwin)
      # visual studio code config files/directory
      ln -sfv $DOTDIR/code/User.symlink/keybindings/macos.symlink $DOTDIR/code/User.symlink/keybindings.json
      ln -sfv $DOTDIR/code/User.symlink/settings/macos.symlink $DOTDIR/code/User.symlink/settings.json
      ln -sfv $DOTDIR/code/User.symlink ~/Library/Application\ Support/Code/User
      ;;
   Linux)
      # visual studio code config files/directory
      ln -sfv $DOTDIR/code/User.symlink/keybindings/linux.symlink $DOTDIR/code/User.symlink/keybindings.json
      ln -sfv $DOTDIR/code/User.symlink/settings/linux.symlink $DOTDIR/code/User.symlink/settings.json
      ln -sfv $DOTDIR/code/User.symlink ~/.config/Code/User
      ;;
esac

# ==== link files specific to WWU lab machines ====
if [ $(whoami) = "henninm3" ]; then
   # global gitconfig file
   ln -sfv $DOTDIR/git/gitconfig-wwu.symlink ~/.gitconfig
   # vim/neovim init file
   ln -sfv $DOTDIR/nvim/nvim.symlink/init/init-wwu.symlink $DOTDIR/nvim/nvim.symlink/init.vim
   # vim/neovim config directory
   ln -sfv $DOTDIR/nvim/nvim.symlink ~/.vim
else
   # global gitconfig file
   ln -sfv $DOTDIR/git/gitconfig.symlink ~/.gitconfig
   # vim/neovim init file
   ln -sfv $DOTDIR/nvim/nvim.symlink/init/init.symlink $DOTDIR/nvim/nvim.symlink/init.vim
   # vim/neovim config directory
   ln -sfv $DOTDIR/nvim/nvim.symlink ~/.config/nvim
   # vi file manager config directory
   ln -sfv $DOTDIR/vifm/vifm.symlink ~/.config/vifm
fi

# ==== link platform agnostic files ====
# atom keymap config file
ln -sfv $DOTDIR/atom/keymap.symlink ~/.atom/keymap.cson
# fish config/functions directory
ln -sfv $DOTDIR/fish/fish.symlink ~/.config/fish
# npm config file
ln -sfv $DOTDIR/npm/npmrc.symlink ~/.npmrc
