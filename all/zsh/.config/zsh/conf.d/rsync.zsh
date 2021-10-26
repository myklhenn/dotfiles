if _zsh_test_cmds 'rsync'; then
    _zsh_add_shortcuts --abbr \
        'rav   % rsync -av' \
        'ravp  % rsync -avP'
fi