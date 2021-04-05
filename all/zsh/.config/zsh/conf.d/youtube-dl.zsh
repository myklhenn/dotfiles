if _zsh_test_cmds 'youtube-dl'; then
    function soundcloud-dl() {
        youtube-dl \
            --format bestaudio \
            --embed-thumbnail \
            --audio-format mp3 \
            --audio-quality 320k \
            --output '%(title)s.%(ext)s' \
            $1
    }
    _zsh_add_shortcuts --abbr \
        'ydl          % youtube-dl' \
        'sdl          % soundcloud-dl' \
        'youtube-mp3  % youtube-dl -x --audio-format "mp3"'
fi