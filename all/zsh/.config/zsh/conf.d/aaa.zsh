# helper functions for interactive zsh environment

function _zsh_add_shortcuts() {
    # Load command shortcuts (aliases and/or abbreviations)
    #
    # Usage: ("[+]" indicates arbitrary amount of whitespace)
    # _zsh_load_shortcut [--abbr] 'ALIAS [+] % EXPANSION'
    # _zsh_load_abbrs [--abbr] \
    #     'FIRST_ALIAS [+] % EXPANSION' \
    #     'NEXT_ALIAS [+] % EXPANSION' \
    #     ...
    #     'LAST_ALIAS [+] % EXPANSION'
    [ "$1" = "--abbr" ] && local ADD_ABBR=1 && shift
    for item in $@; do
        # remove whitespace on either side of "%" to create "WORD%EXPANSION"
        local item="$(print $item | sed 's/  *% /%/')"
        # split at "%" to create array "(WORD EXPANSION)"
        local new_sc=(${(s/%/)item})
        alias $new_sc[1]="${new_sc[2]}"
        if [ "$ADD_ABBR" = '1' ] && [ -z "$(abbr x ${new_sc[1]})" ]; then
            abbr $new_sc[1]="${new_sc[2]}"
        fi
    done
}

function _zsh_add_to_path() {
    # Append new directories to $PATH
    for new_path in $@; do
        if [ -d "$new_path" ] && [[ "$PATH" == *"$new_path"* ]]; then
            export PATH="$PATH:$new_path"
        fi
    done
}

function _zsh_test_cmds() {
    # Test if commands exist
    for cmd in $@; do
        type -p "$cmd" > /dev/null || return 1
    done
}
