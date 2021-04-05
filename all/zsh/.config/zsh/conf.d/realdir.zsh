function realdir() {
    # show error and exit if required commands are missing
    local error_msg='Install "%s" on your system before using this function.'
    if ! _zsh_test_cmds 'dirname'; then
        printf $error_msg 'dirname'
    elif ! _zsh_test_cmds 'realpath'; then
        printf $error_msg 'realpath'
    else
        if [ $? -eq 0 ]; then
            echo 'realdir: missing operand'
            echo 'usage: realdir path'
        else
            # go to directory of linked file
            cd "$(dirname "$(realpath $@)")"
        fi
    fi
}