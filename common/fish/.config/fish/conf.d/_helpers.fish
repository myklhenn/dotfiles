# fish shell helper functions sourced for use during shell startup

function __fish_load_abbrs -d "Load fish abbreviations from a list"
  # format of argv[1]:
  #   "FIRST_WORD   % EXPANSION" \
  #   "NEXT_WORD    % EXPANSION" \
  #   ...
  #   "LAST_WORD    % EXPANSION"
  for item in $argv[1]
    set -l new_abbr (string split -m 1 "%" $item)
    abbr --add (string trim $new_abbr[1]) (string trim $new_abbr[2])
  end
end

function __fish_add_to_path -d "Append new directories to PATH"
  for NEW_PATH in $argv
    if test -d $NEW_PATH
      set -U -a fish_user_paths $NEW_PATH
    end
  end
end