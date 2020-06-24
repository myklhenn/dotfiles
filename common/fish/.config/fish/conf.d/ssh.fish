# fish shell abbreviations sourced for ssh

if __fish_test_cmds "ssh-add" "ssh-add-key"
    abbr --add sa "ssh-add-key"
end

if __fish_test_cmds "ssh-keygen" "ssh-new-key"
    abbr --add sk "ssh-new-key"
end

if __fish_test_cmds "ssh-connect"
    abbr --add sc "ssh-connect"
end