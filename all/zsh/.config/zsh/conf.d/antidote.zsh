if ! _zsh_test_cmds 'antidote'; then
    if ! _zsh_test_cmds 'git'; then
        print "Startup script \"$0\" requires \"git\" to run."
        print 'Please install before next shell startup.'
    else
        print 'Antidote not found. Installing...'
        if _zsh_test_commands 'brew'; then
            brew install antidote
        elif ! _zsh_test_cmds 'git'; then
            print "Install script \"$0\" requires \"git\" to run."
            print 'Please install before next shell startup.'
            exit 0
        else
            git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
        fi
        # generate static plugins file
        print 'Generating Antidote plugin file'
        antidote bundle < $AD_PLUGIN_LIST > $AD_PLUGIN_FILE
        source $AD_PLUGIN_FILE
    fi
fi