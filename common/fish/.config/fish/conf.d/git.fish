# fish shell abbreviations sourced for git

if test (which git)
  __fish_load_abbrs \
    # alias   command
    "ga       % git add" \
    "gaa      % git add --all" \
    "gb       % git branch" \
    "gbd      % git branch --delete" \
    "gc       % git checkout" \
    "gcb      % git checkout -b" \
    "gcm      % git commit" \
    "gcmm     % git commit -m" \
    "gf       % git fetch" \
    "gp       % git push" \
    "gpo      % git push origin" \
    "gpom     % git push origin master" \
    "gpl      % git pull" \
    "gplo     % git pull origin" \
    "gplom    % git pull origin master" \
    "gs       % git status" \
    "gss      % git status -s"
end