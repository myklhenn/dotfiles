# fish shell abbreviations sourced for ssh

if test (which ssh-add)
  __fish_load_abbrs \
    # alias   command
    "sa       % ssh-add-key"
end

if test (which ssh-keygen)
  __fish_load_abbrs \
    # alias   command
    "sk       % ssh-new-key"
end

if test (which ssh-connect)
  __fish_load_abbrs \
    # alias   command
    "sc       % ssh-connect"
end