_zsh_test_cmds 'ssh-add' && _zsh_add_shortcuts --abbr \
    'sal  % ssh-add -l' \
    'sad  % ssh-add -D'

_zsh_test_cmds 'ssh-add' 'ssh-add-key' && _zsh_add_shortcuts --abbr \
    'sa   % ssh-add-key'

_zsh_test_cmds 'ssh-keygen' 'ssh-new-key' && _zsh_add_shortcuts --abbr \
    'sk   % ssh-new-key'

_zsh_test_cmds 'ssh-connect' && _zsh_add_shortcuts --abbr \
    'sc   % ssh-connect'
