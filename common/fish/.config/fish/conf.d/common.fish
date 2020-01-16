# fish shell abbreviations sourced for all platforms

if test (which exa)
  set -g LS_CMD     "exa -lhg"
  set -g LS_ALL_CMD "exa -lahg"
else
  set -g LS_CMD     "ls -lh"
  set -g LS_ALL_CMD "ls -lah"
end

__fish_load_abbrs \
  # alias   command
  "c        % clear" \
  "cl       % clear; $LS_CMD" \
  "cla      % clear; $LS_ALL_CMD" \
  "l        % $LS_CMD" \
  "la       % $LS_ALL_CMD" \
  "q        % exit" \
  "py       % python3"

# cleanup
set -e LS_CMD
set -e LS_ALL_CMD