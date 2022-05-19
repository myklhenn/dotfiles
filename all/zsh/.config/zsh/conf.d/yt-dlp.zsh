if _zsh_test_cmds 'yt-dlp'; then
    function ydl() {
        # a function for yt-dlp shortcuts
        case "$1" in
            "f") yt-dlp \
                --format "$2" \
                --output '%(title)s.%(ext)s' \
                "$3";;
            "ft") yt-dlp \
                --format "$2" \
                --write-thumbnail \
                --output '%(title)s.%(ext)s' \
                "$3";;
            "lf") yt-dlp \
                --list-formats \
                "$2";;
            *) return;;
        esac
    }

    function soundcloud-dl() {
        yt-dlp \
            --format bestaudio \
            --embed-thumbnail \
            --write-thumbnail \
            --audio-format mp3 \
            --audio-quality 320k \
            --output '%(title)s.%(ext)s' \
            $@
    }
    function soundcloud-dl-img() {
        yt-dlp \
            --embed-thumbnail \
            --skip-download \
            --output '%(title)s.%(ext)s' \
            $@
    }
    function ydl-best-mkv() {
        yt-dlp \
            --format bestvideo+bestaudio \
            --merge-output-format mkv \
            --output '%(title)s.%(ext)s' \
            $@
    }
    _zsh_add_shortcuts --abbr \
        'sdl          % soundcloud-dl' \
        'sdli         % soundcloud-dl-img' \
        'ybm          % ydl-best-mkv' \
        'ydls         % yt-dlp --list-formats' \
        'ydt          % yt-dlp --skip-download --write-thumbnail' \
        'yt-mp3  % yt-dlp -x --audio-format=mp3'
fi