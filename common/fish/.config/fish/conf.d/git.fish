# fish shell abbreviations sourced for git

if test (which git)
  set -l ABBRS \
    # alias   command
    ga        "git add" \
    gaa       "git add --all" \
    gb        "git branch" \
    gbd       "git branch --delete" \
    gc        "git checkout" \
    gcb       "git checkout -b" \
    gcm       "git commit" \
    gcmm      "git commit -m" \
    gf        "git fetch" \
    gp        "git push" \
    gpo       "git push origin" \
    gpom      "git push origin master" \
    gpl       "git pull" \
    gplo      "git pull origin" \
    gplom     "git pull origin master" \
    gs        "git status" \
    gss       "git status -s"

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
end