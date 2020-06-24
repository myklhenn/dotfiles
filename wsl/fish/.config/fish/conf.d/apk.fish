# fish shell abbreviations sourced for apk

if __fish_test_cmds "apk"
    __fish_load_abbrs \
        # alias   command
        "aup      % apk update" \
        "au       % apk upgrade" \
        "ai       % apk add" \
        "al       % apk list" \
        "ain      % apk info" \
        "ar       % apk del" \
        "as       % apk search" \
        "ao       % apk list -u"
end