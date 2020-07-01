# fish shell abbreviations sourced for scoop

if __fish_test_cmds "scoop"
    __fish_load_abbrs \
        # alias   command
        "su       % scoop update" \
        "sua      % scoop update \*" \
        "si       % scoop install" \
        "sl       % scoop list" \
        "sin      % scoop info" \
        "sr       % scoop uninstall" \
        "ss       % scoop search" \
        "so       % scoop status" \
        "scl      % scoop cleanup"
end

if __fish_test_cmds "scoop-filter"
    __fish_load_abbrs \
        # alias   command
        "sf       % scoop-filter" \
        "sfa      % scoop-filter --all" \
        "sfam     % scoop-filter --all --multi" \
        "sfi      % scoop-filter --installed" \
        "sfim     % scoop-filter --installed --multi" \
        "sfm      % scoop-filter --multi" \
        "sif      % scoop install (scoop-filter)" \
        "suf      % scoop update (scoop-filter --installed)" \
        "sufm     % scoop update (scoop-filter --installed --multi)" \
        "suff     % scoop update --force (scoop-filter --installed)" \
        "suffm    % scoop update --force (scoop-filter --installed --multi)" \
        "sufmf    % scoop update --force (scoop-filter --installed --multi)" \
        "sinf     % scoop info (scoop-filter --all)" \
        "srf      % scoop uninstall (scoop-filter --installed)" \
        "srfm      % scoop uninstall (scoop-filter --installed --multi)"
end