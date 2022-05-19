if ! _zsh_test_cmds 'antibody'; then
    if ! _zsh_test_cmds 'curl'; then
        print "Startup script \"$0\" requires \"curl\" to run."
        print 'Please install before next shell startup.'
    else
        print 'Antibody not found. Installing...'
        if _zsh_test_commands 'brew'; then
            brew install antibody
        else
            curl -sfL git.io/antibody | sh -s - -b $SCRIPTS
        fi
        # generate static plugins file
        antibody bundle < $AB_PLUGIN_LIST > $AB_PLUGIN_FILE
        source $AB_PLUGIN_FILE
    fi
fi