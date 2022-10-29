if _zsh_test_cmds 'fzy'; then
    function fzy-cd() {
        local cd_dir=$(ls -d1 */ | fzy)
        [ -z "$cd_dir" ] && return 1
        cd "$cd_dir"
    }
    function fzy-cd-all() {
        # TODO: need to make this work when */ doesn't find anything
        local cd_dir=$(ls -d1 */ .*/ | fzy)
        [ -z "$cd_dir" ] && return 1
        cd "$cd_dir"
    }
    _zsh_add_shortcuts --abbr \
        'zd   % fzy-cd' \
        'zda  % fzy-cd-all'
fi