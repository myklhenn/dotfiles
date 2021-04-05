if ! _zsh_test_cmds nvim; then
    print 'File editor "neovim" was not found.'
    print 'Some env variables will not be set correctly'
    print 'until it is installed and the shell is restarted.'
else
    export EDITOR='nvim'
    export VISUAL='nvim'
    export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

    _zsh_add_shortcuts \
        "vim  % nvim" \
        "vi   % nvim"

    if ! [ -e "$VIMCONFIG/autoload/plug.vim" ]; then
        if ! _zsh_test_cmds curl; then
            print "Startup script \"$0\" requires \"curl\" to run."
            print 'Please install before next shell startup.'
        else
            print "\"vim-plug\" not found. Installing..."
            curl -fLo "$VIMCONFIG/autoload/plug.vim" --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            # install plugins non-interactively
            nvim +'PlugInstall --sync' +qa
        fi
    fi
fi