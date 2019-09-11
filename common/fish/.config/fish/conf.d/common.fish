# fish shell abbreviations sourced for all platforms

if test (which exa)
  set -g LS_CMD     "exa -lhg"
  set -g LS_ALL_CMD "exa -lahg"
else
  set -g LS_CMD     "ls -lh"
  set -g LS_ALL_CMD "ls -lah"
end

set -l ABBRS \
  # alias   command
  c         "clear" \
  cl        "clear; $LS_CMD" \
  cla       "clear; $LS_ALL_CMD" \
  l         "$LS_CMD" \
  la        "$LS_ALL_CMD" \
  q         "exit" \
  py        "python3"

set -l N (count $ABBRS)
set -g I 1
while test $I -lt $N
  set -l ALIAS $ABBRS[$I]
  set -l COMMAND $ABBRS[(math $I + 1)]
  abbr --add $ALIAS "$COMMAND"
  set -g I (math $I + 2)
end

# cleanup
set -e I
set -e LS_CMD
set -e LS_ALL_CMD