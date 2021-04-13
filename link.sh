#!/bin/bash
#
# A script to link dotfiles located in this repository to $HOME, using "stow"
#
# Created by Michael Henning <mykl951@gmail.com> -- https://github.com/myklhenn

default_platform='all'

msg() {
    if [ "$dotfiles_valid" = "1" ]; then
        $DOTFILES/$default_platform/bin/.local/bin/msg "$@"
    else
        line_format="[%s] %s\n"
        case "$1" in
            '-e'|'--error') tput colors > /dev/null 2>&1 \
                && line_format="[\033[0;31mERROR\033[0m] %s\n" ;;
            '-w'|'--warn')  tput colors > /dev/null 2>&1 \
                && line_format="[\033[0;33mWARN\033[0m] %s\n" ;;
        esac
        for str in "${@:2}"; do
            printf "$line_format" "$str"
        done
    fi
}
check_dotfiles_env() {
    if [ -z "$DOTFILES" ]; then
        msg -w "\"\$DOTFILES\" environment variable not set."
        msg -w "Using default value \"$HOME/.dotfiles\"."
        DOTFILES="$HOME/.dotfiles"
    fi
    if [ ! -d "$DOTFILES" ] || [ ! -d "$DOTFILES/$default_platform" ]; then
        msg -e "Path in \"\$DOTFILES\" environment variable does not" \
            "contain a valid dotfiles folder." \
            "Please fix before using this script."
        exit 1
    fi
    dotfiles_valid=1
}
check_commands() {
    # ($1: name of command)
    error='[\033[0;31mERROR\033[0m] %s\n'
    for chk_cmd in $@; do
        if ! which $chk_cmd > /dev/null; then
            msg -e "Could not find \"$chk_cmd\" command on your system."
            errors=1
        fi
    done
    if [ "$errors" = "1" ]; then
        msg -e "Please install before using this script."
        exit 1
    fi
}
add_platform () {
    # ($1: name of platform's directory)
    msg -i "found platform \"$1\""
    platforms="$platforms $1"
}
create_dir () {
    # ($1: description of directory, $2: path to directory)
    msg -i "creating directory for \"$1\""
    mkdir -pv $2
    if [ $? -ne 0 ]; then
        msg -e "error creating directory for \"$1\""
        errors=1;
    fi
}
link_package () {
    # ($1: name of platform, $2: name of package's directory)
    msg -i "creating symlinks for \"$1/$2\""
    stow $stow_opts --verbose --ignore=\".DS_Store\" --target=$HOME $2
    if [ $? -ne 0 ]; then
        msg -e "error creating symlinks for \"$1/$2\""
        errors=1;
    fi
}
check_errors () {
    if [ "$iterm_prefs" = "1" ]; then
        msg -w "NOTE: iTerm overwrites links when saving preferences." \
            "As a workaround, configure iTerm to load preferences from:" \
            "$HOME/.config/iterm2"
    fi
    if [ "$errors" = "1" ]; then
        msg -f "done, but with errors."
        exit 1
    else
        msg -s "done."
        exit 0
    fi
}

iterm_prefs=0
errors=0

check_commands "stow" "realpath"
check_dotfiles_env

platforms=""
add_platform "$default_platform"
uname -r | grep "Microsoft" > /dev/null && add_platform "wsl"
case $(uname) in
    Darwin) add_platform "macos" ;;
    Linux) add_platform "linux" ;;
esac

create_dir "zsh startup scripts" ~/.config/zsh/conf.d
create_dir "user scripts" ~/.local/bin

stow_opts='--restow'
[ "$1" = '--unlink' ] && stow_opts='--delete'

for platform in $platforms; do
    cd "$DOTFILES"/"$platform"
    for pkg_dir in ./*; do
        pkg_name=$(basename $pkg_dir)
        [ "$pkg_name" = "*" ] && continue # skip platforms with no packages
        link_package $platform $pkg_name
        if [ "$pkg_name" = "iterm" ]; then iterm_prefs=1; fi
    done
done

check_errors