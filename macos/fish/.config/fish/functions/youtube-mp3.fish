function youtube-mp3 -d "Download MP3 audio of the specified YouTube video"
  youtube-dl -x --audio-format "mp3" $argv
end
