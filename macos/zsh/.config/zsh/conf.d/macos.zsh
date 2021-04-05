if [ -d "$HOME/Downloads/repositories" ]; then
    export REPO_DIR="$HOME/Downloads/repositories"
    if _zsh_test_cmds 'fzy'; then
        function _repo_helper() {
            # choose a repository to pass to command "$1"
            local repo="$(ls -1 $REPO_DIR | fzy --prompt 'Select Repo: ')"
            [ -n "$repo" ] && $1 "$REPO_DIR/$REPO"
        }
        _zsh_add_shortcuts \
            'repo       % _repo_helper "cd"' \
            'open-repo  % _repo_helper "code"'
    fi
fi

_zsh_add_to_path \
    '/Applications/Vivaldi.app/Contents/MacOS' \
    '/Applications/Vivaldi Snapshot.app/Contents/MacOS'

_zsh_add_shortcuts \
    'finder  % open -R'