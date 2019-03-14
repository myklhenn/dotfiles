# fish shell abbreviations sourced for all platforms

if test (which exa)
  set -g LS_CMD     "exa -lhg"
  set -g LS_ALL_CMD "exa -lahg"
else
  set -g LS_CMD     "ls -lh"
  set -g LS_ALL_CMD "ls -lah"
end

abbr --add c   "clear"
abbr --add cl  "clear; $LS_CMD"
abbr --add cla "clear; $LS_ALL_CMD"
abbr --add l   "$LS_CMD"
abbr --add la  "$LS_ALL_CMD"
abbr --add q   "exit"
abbr --add py  "python3"

# cleanup
set -e LS_CMD
set -e LS_ALL_CMD