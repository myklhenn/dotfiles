# fish shell abbreviations sourced for all platforms

test (which exa)
  and set -l LS_CMD "exa"
  or  set -l LS_CMD "ls"

__fish_load_abbrs \
  # alias   command
  "c        % clear" \
  "cl       % clear; $LS_CMD -lhg" \
  "cla      % clear; $LS_CMD -lahg" \
  "l        % $LS_CMD -lhg" \
  "la       % $LS_CMD -lahg" \
  "q        % exit" \
  "py       % python3"