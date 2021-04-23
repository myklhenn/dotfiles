if _zsh_test_cmds fast-theme; then
    if [ -d "$XDG_CONFIG_HOME/fsh/monokai-pro.ini" ]; then
        if ! fast-theme --show | grep 'monokai-pro' > /dev/null; then
            fast-theme --quiet XDG:monokai-pro
        fi
    fi
fi