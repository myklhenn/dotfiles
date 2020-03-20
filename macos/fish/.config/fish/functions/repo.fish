function repo -d "Choose a repository to navigate to"
  set -l REPO (ls $REPO_DIR | fzy --prompt 'Select Repo: ')
  if not test -z "$REPO"; cd "$REPO_DIR/$REPO"; end
end