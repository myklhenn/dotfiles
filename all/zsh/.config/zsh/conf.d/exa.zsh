if ! _zsh_test_cmds exa; then
    print 'Directory lister "exa" was not found.'
    print 'Some abbreviations will not be set correctly'
    print 'until it is installed and the shell is restarted.'
else
    local L_OPTS="--group-directories-first"
    local LL_OPTS="$L_OPTS --long --header --group --time-style=long-iso"
    function _exa_tree_helper() {
        local T_OPTS="$LL_OPTS $1 --tree"
        [[ "$2" =~ ^[0-9]+$ ]] && T_OPTS="$T_OPTS --level=$2"
        exa $(eval "for OPT in $T_OPTS; do printf '%s ' \$OPT; done") ${@:3}
    }

    _zsh_add_shortcuts \
        "l       % exa $L_OPTS" \
        "la      % exa $L_OPTS --all" \
        "ll      % exa $LL_OPTS" \
        "llt     % _exa_tree_helper ''" \
        "llh     % exa $LL_OPTS --links" \
        "llht    % _exa_tree_helper '--links'" \
        "lla     % exa $LL_OPTS --all" \
        "llat    % _exa_tree_helper '--all'" \
        "llah    % exa $LL_OPTS --all --links" \
        "llaht   % _exa_tree_helper '--all --links'" \
        "llaa    % exa $LL_OPTS --all --all" \
        "llaat   % _exa_tree_helper '--all --all'" \
        "llaah   % exa $LL_OPTS --all --all --links" \
        "llaaht  % _exa_tree_helper '--all --all --links'"

    # function llt() {
    #     _exa_tree_helper "" $@
    # }
    # function llht() {
    #     _exa_tree_helper "--links" $@
    # }
    # function llat() {
    #     _exa_tree_helper "--all" $@
    # }
    # function llaht() {
    #     _exa_tree_helper "--all --links" $@
    # }
    # function llaat() {
    #     _exa_tree_helper "--all --all" $@
    # }
    # function llaaht() {
    #     _exa_tree_helper "--all --all --links" $@
    # }
fi