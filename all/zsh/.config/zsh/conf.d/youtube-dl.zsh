if _zsh_test_cmds 'youtube-dl'; then
    function ydl() {
        # a function for youtube-dl shortcuts
        case "$1" in
            "f") youtube-dl \
                --format "$2" \
                --output '%(title)s.%(ext)s' \
                "$3";;
            "ft") youtube-dl \
                --format "$2" \
                --write-thumbnail \
                --output '%(title)s.%(ext)s' \
                "$3";;
            "lf") youtube-dl \
                --list-formats \
                "$2";;
            *) return;;
        esac
    }

    function soundcloud-dl() {
        youtube-dl \
            --format bestaudio \
            --embed-thumbnail \
            --audio-format mp3 \
            --audio-quality 320k \
            --output '%(title)s.%(ext)s' \
            $@
    }
    function ydl-best-mkv() {
        youtube-dl \
            --format bestvideo+bestaudio \
            --merge-output-format mkv \
            --output '%(title)s.%(ext)s' \
            $@
    }
    _zsh_add_shortcuts --abbr \
        'sdl          % soundcloud-dl' \
        'ybm          % ydl-best-mkv' \
        'ydls         % youtube-dl --list-formats' \
        'ydt          % youtube-dl --skip-download --write-thumbnail' \
        'youtube-mp3  % youtube-dl -x --audio-format=mp3'
fi