if [ "$EDITOR" = 'nvim' ]; then
    local EDITOR_CMD="$EDITOR -c 'set ft=man ts=8 nomod nolist nonu noma' -"
    local PAGER_CMD="/bin/sh -c \"col -b | $EDITOR_CMD\""
    export MANPAGER="$PAGER_CMD"
    export PAGER="$PAGER_CMD"
fi

# https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/