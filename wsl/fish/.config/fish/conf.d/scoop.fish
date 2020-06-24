# fish shell abbreviations sourced for scoop

if __fish_test_cmds "scoop"
    __fish_load_abbrs \
        # alias   command
        "su       % scoop update" \
        "sua      % scoop update \*" \
        "si       % scoop install" \
        "sif      % scoop install (scoop-filter)" \
        "sl       % scoop list" \
        "sin      % scoop info" \
        "sr       % scoop uninstall" \
        "ss       % scoop search" \
        "so       % scoop status" \
        "sf       % scoop-filter"
end