# fish shell helper functions sourced for use during shell startup

function __fish_load_abbrs -d "Load fish abbreviations from a list"
  # format of argv:
  #   "FIRST_WORD   % EXPANSION" \
  #   "NEXT_WORD    % EXPANSION" \
  #   ...
  #   "LAST_WORD    % EXPANSION"
  for item in $argv
    set -l new_abbr (string split -m 1 "%" $item)
    abbr --add (string trim $new_abbr[1]) (string trim $new_abbr[2])
  end
end

function __fish_add_to_path -d "Append new directories to PATH"
  for new_path in $argv
    if test -d "$new_path"
      set -U -a fish_user_paths $new_path
    end
  end
end

function __fish_test_cmds -d "Test if commands exist"
  for cmd in $argv
    test (which $cmd); or return 1
  end
end