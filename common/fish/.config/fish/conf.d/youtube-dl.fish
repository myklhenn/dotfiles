# fish shell functions and abbreviations sourced for youtube-dl

if test (which youtube-dl)
  function soundcloud-dl -a URL
    youtube-dl \
      --format bestaudio \
      --embed-thumbnail \
      --audio-format mp3 \
      --audio-quality 320k \
      --output "%(title)s.%(ext)s" \
      $URL
  end

  __fish_load_abbrs \
    # alias   command
    "ydl      % youtube-dl" \
    "sdl      % soundcloud-dl"
end