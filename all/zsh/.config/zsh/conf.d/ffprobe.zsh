if _zsh_test_cmds 'ffprobe'; then
    function ffp() {
        ffprobe \
            -hide_banner \
            -loglevel warning \
            -print_format flat \
            -show_entries stream=index,codec_long_name,codec_type \
            "$@" \
    }
fi