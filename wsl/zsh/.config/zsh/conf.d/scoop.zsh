_zsh_test_cmds 'scoop' && _zsh_add_shortcuts --abbr \
    "su     % scoop update" \
    "sua    % scoop update *" \
    "si     % scoop install" \
    "sl     % scoop list" \
    "sin    % scoop info" \
    "sr     % scoop uninstall" \
    "ss     % scoop search" \
    "so     % scoop status" \
    "scl    % scoop cleanup" \
    "scla   % scoop cleanup *" \
    "scs    % scoop cache show" \
    "scr    % scoop cache rm" \
    "scra   % scoop cache rm *"

_zsh_test_cmds 'scoop-filter' && _zsh_add_shortcuts --abbr \
    "sf     % scoop-filter" \
    "sfa    % scoop-filter --all" \
    "sfam   % scoop-filter --all --multi" \
    "sfi    % scoop-filter --installed" \
    "sfim   % scoop-filter --installed --multi" \
    "sfm    % scoop-filter --multi" \
    "sif    % scoop install (scoop-filter)" \
    "sifm   % scoop install (scoop-filter --multi)" \
    "suf    % scoop update (scoop-filter --installed)" \
    "sufm   % scoop update (scoop-filter --installed--multi)" \
    "suff   % scoop update --force (scoop-filter--installed)" \
    "suffm  % scoop update --force (scoop-filter--installed --multi)" \
    "sufmf  % scoop update --force (scoop-filter--installed --multi)" \
    "sinf   % scoop info (scoop-filter --all)" \
    "srf    % scoop uninstall (scoop-filter --installed)" \
    "srfm   % scoop uninstall (scoop-filter --installed--multi)" \
    "sclf   % scoop cleanup (scoop-filter --installed)" \
    "sclfm  % scoop cleanup (scoop-filter --installed--multi)"
