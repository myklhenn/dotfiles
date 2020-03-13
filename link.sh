#!/bin/sh
#
# A script to link dotfiles located in this repository to $HOME, using "stow"
#
# Created by Michael Henning <mykl951@gmail.com> -- https://github.com/myklhenn

GC="\033[0;32m" # green color
YC="\033[0;33m" # yellow color
CC="\033[0;36m" # cyan color
RC="\033[0;31m" # red color
NC="\033[0m" # no color

check_command() {
	# ($1: name of command)
	if ! which $1 > /dev/null; then
		echo $YC"Could not find \"$1\" command on your system."$NC
		echo $YC"Please install before using this script."$NC
		exit 1
	fi
}
add_platform () {
	# ($1: name of platform's directory)
	echo $CC"found platform \"$1\""$NC
	PLATFORMS=$PLATFORMS" $1"
}
create_dir () {
	# ($1: description of directory, $2: path to directory)
	echo $YC"creating directory for \"$1\""$NC
	mkdir -pv $2
	if [ $? -ne 0 ]; then ERRORS=1; fi
}
link_package () {
	# ($1: name of package's directory)
	echo $CC"creating symlinks for \"$1\""$NC
	stow --restow --verbose --ignore=".DS_Store" --target=$HOME $1
	if [ $? -ne 0 ]; then ERRORS=1; fi
}
check_errors () {
	if [ "$ITERM_PREFS" = "1" ]; then
		echo $YC"\nNOTE: iTerm overwrites links when saving preferences."$NC
		echo $YC"As a workaround, configure iTerm to load preferences from:"$NC
		echo $YC"\n$HOME/.config/iterm\n"$NC
	fi
	if [ $ERRORS -ne 0 ]; then
		echo $RC"done, but with errors.\n"$NC
		exit 1
	else
		echo $GC"done.\n"$NC
		exit 0
	fi
}

ITERM_PREFS=0
ERRORS=0

check_command "stow"
check_command "realpath"
DOTFILES_DIR=$(dirname $(realpath $0))

PLATFORMS=""
add_platform "common"

uname -r | grep "Microsoft" > /dev/null && add_platform "wsl"

case $(uname) in
	Darwin) add_platform "macos" ;;
	Linux) add_platform "linux" ;;
esac

create_dir "fish shell functions" ~/.config/fish/functions
create_dir "fish shell configurations" ~/.config/fish/conf.d
create_dir "user scripts" ~/.local/bin

for PLATFORM in $PLATFORMS; do
	cd "$DOTFILES_DIR"/"$PLATFORM"
	for PKG_DIR in ./*; do
		PKG_NAME=$(basename $PKG_DIR)
		link_package $PKG_NAME
		if [ "$PKG_NAME" = "iterm" ]; then ITERM_PREFS=1; fi
	done
done

check_errors