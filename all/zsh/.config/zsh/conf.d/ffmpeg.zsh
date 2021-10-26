if _zsh_test_cmds 'ffmpeg'; then
    function aif-to-wav() {
        for aif_file in *.(aif|m4a); do
            print "converting file '$aif_file'"
            wav_file="${aif_file[1,-5]}.wav"
            ffmpeg \
                -hide_banner \
                -loglevel warning \
                -i "$aif_file" \
                -c:a pcm_s16le \
                "$wav_file"
            print "conversion done for file '$aif_file'"

            ctime=$(stat -t '%Y%m%d%H%M' -f '%Sm' "$aif_file")
	        touch -t "$ctime" "$wav_file"
            print "creation time for '$wav_file' updated to '$ctime'"
        done
        printf "%s\n\n" "done converting all files"
    }

    function aif-to-alac() {
        for aif_file in *.aif; do
            print "converting file '$aif_file'"
            alac_file="${aif_file[1,-5]}.m4a"
            ffmpeg \
                -hide_banner \
                -loglevel warning \
                -i "$aif_file" \
                -c:a alac \
                "$alac_file"
            print "conversion done for file '$aif_file'"

            ctime=$(stat -t '%Y%m%d%H%M' -f '%Sm' "$aif_file")
	        touch -t "$ctime" "$alac_file"
            print "creation time for '$alac_file' updated to '$ctime'"
        done
        printf "%s\n\n" "done converting all files"
    }

    function fix-timestamp() {
        for fname in *.(aif|m4a); do
            fdate="${fname[1,4]}${fname[6,7]}${fname[9,10]}"
            ftime="${fname[12,13]}${fname[15,16]}.${fname[18,19]}"
            touch -t "$fdate$ftime" "$fname"
        done
    }

    _zsh_add_shortcuts --abbr \
        'aw  % aif-to-wav'
fi