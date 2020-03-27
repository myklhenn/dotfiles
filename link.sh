#!/bin/sh
#
# A script to link dotfiles located in this repository to $HOME, using "stow"
#
# Created by Michael Henning <mykl951@gmail.com> -- https://github.com/myklhenn

GC="\033[0;32m%s\033[0m\n" # green color
YC="\033[0;33m%s\033[0m\n" # yellow color
CC="\033[0;36m%s\033[0m\n" # cyan color
RC="\033[0;31m%s\033[0m\n" # red color
NC="\033[0m%s\n" # normal color

check_command() {
	# ($1: name of command)
	if ! which $1 > /dev/null; then
		printf $YC "Could not find \"$1\" command on your system."
		printf $YC "Please install before using this script."
		exit 1
	fi
}
add_platform () {
	# ($1: name of platform's directory)
	printf $CC "found platform \"$1\""
	PLATFORMS="$PLATFORMS $1"
}
create_dir () {
	# ($1: description of directory, $2: path to directory)
	printf $YC "creating directory for \"$1\""
	mkdir -pv $2
	if [ $? -ne 0 ]; then
		printf $RC "error creating directory for \"$1\""
		ERRORS=1;
	fi
}
link_package () {
	# ($1: name of platform, $2: name of package's directory)
	printf $CC "creating symlinks for \"$1/$2\""
	stow --restow --verbose --ignore=".DS_Store" --target=$HOME $2
	if [ $? -ne 0 ]; then
		printf $RC "error creating symlinks for \"$1/$2\""
		ERRORS=1;
	fi
}
check_errors () {
	if [ "$ITERM_PREFS" = "1" ]; then
		printf $YC "NOTE: iTerm overwrites links when saving preferences."
		printf $YC "As a workaround, configure iTerm to load preferences from:"
		printf $YC "$HOME/.config/iterm"
	fi
	if [ "$ERRORS" = "1" ]; then
		printf $RC "done, but with errors."
		exit 1
	else
		printf $GC "done."
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
		link_package $PLATFORM $PKG_NAME
		if [ "$PKG_NAME" = "iterm" ]; then ITERM_PREFS=1; fi
	done
done

check_errors