function _fsh_set_theme() {
    if _zsh_test_cmds fast-theme; then
        if [ -f "$XDG_CONFIG_HOME/fsh/$1.ini" ]; then
            if ! fast-theme --show | grep $1 > /dev/null; then
                fast-theme --quiet XDG:$1
            fi
        fi
    fi
}

_fsh_set_theme 'catppuccin-macchiato'
