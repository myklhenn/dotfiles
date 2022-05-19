if _zsh_test_cmds 'eyeD3'; then
    function extract-img() {
        # a function for extracting images embedded in media files (i.e. MP3s)
        eyeD3 --write-images="$PWD" $@
    }

    _zsh_add_shortcuts --abbr \
        'eximg        % extract-img'
fi