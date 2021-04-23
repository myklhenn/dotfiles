if ! _zsh_test_cmds bat; then
    print 'File concatenator "bat" was not found.'
    print 'Some env variables will not be set correctly'
    print 'until it is installed and the shell is restarted.'
else
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export BAT_THEME="Monokai Pro"
    export BAT_STYLE="numbers,rule,snip"
    _zsh_add_shortcuts "cat  % bat --paging=never"
fi