function nohist() {
    # toggle writing of zsh command history (and update prompt with indicator)
    if [[ -v HISTFILE ]]; then
        unset HISTFILE
        source $ZCONFDIR/prompt.zsh
    else
        printf '%s\n' "reloading zsh..."
        exec $SHELL
    fi
}

_zsh_add_shortcuts --abbr \
    'nh  % nohist'
