#!/usr/bin/env fish

set -l DOTFILES $HOME/.dotfiles

echo "Creating symlinks..."

set -l LINKS (find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for FILE in $LINKS
    set -l target "$HOME/.(basename $FILE '.symlink')"
    if test -e $target
        echo "~(target#$HOME) already exists... skipping."
    else
        echo "Link created for $FILE"
        ln -s $FILE $target
    end
end
