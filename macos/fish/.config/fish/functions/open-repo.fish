function open-repo -d "Choose a repository to open in vscode-insiders"
  set -l REPO (ls $REPO_DIR | fzy --prompt 'Select Repo: ')
  if not test -z "$REPO"; code-insiders "$REPO_DIR/$REPO"; end
end