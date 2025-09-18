if ! _zsh_test_cmds eza; then
    print 'Directory lister "eza" was not found.'
    print 'Some abbreviations will not be set correctly'
    print 'until it is installed and the shell is restarted.'
else
    local L_OPTS="--group-directories-first"
    local LL_OPTS="$L_OPTS --long --header --group --time-style=long-iso"
    function _eza_tree_helper() {
        local T_OPTS="$LL_OPTS $1 --tree"
        [[ "$2" =~ ^[0-9]+$ ]] && T_OPTS="$T_OPTS --level=$2"
        eza $(eval "for OPT in $T_OPTS; do printf '%s ' \$OPT; done") ${@:3}
    }

    _zsh_add_shortcuts \
        "l       % eza $L_OPTS" \
        "la      % eza $L_OPTS --all" \
        "ll      % eza $LL_OPTS" \
        "llt     % _eza_tree_helper ''" \
        "llh     % eza $LL_OPTS --links" \
        "llht    % _eza_tree_helper '--links'" \
        "lla     % eza $LL_OPTS --all" \
        "llat    % _eza_tree_helper '--all'" \
        "llah    % eza $LL_OPTS --all --links" \
        "llaht   % _eza_tree_helper '--all --links'" \
        "llaa    % eza $LL_OPTS --all --all" \
        "llaat   % _eza_tree_helper '--all --all'" \
        "llaah   % eza $LL_OPTS --all --all --links" \
        "llaaht  % _eza_tree_helper '--all --all --links'"

    # function llt() {
    #     _eza_tree_helper "" $@
    # }
    # function llht() {
    #     _eza_tree_helper "--links" $@
    # }
    # function llat() {
    #     _eza_tree_helper "--all" $@
    # }
    # function llaht() {
    #     _eza_tree_helper "--all --links" $@
    # }
    # function llaat() {
    #     _eza_tree_helper "--all --all" $@
    # }
    # function llaaht() {
    #     _eza_tree_helper "--all --all --links" $@
    # }
fi