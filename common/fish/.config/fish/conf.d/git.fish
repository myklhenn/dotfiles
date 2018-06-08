# fish shell abbreviations sourced for git

if test (which git)
  abbr --add ga    "git add"
  abbr --add gaa   "git add --all"
  abbr --add gb    "git branch"
  abbr --add gbd   "git branch --delete"
  abbr --add gc    "git checkout"
  abbr --add gcb   "git checkout -b"
  abbr --add gcm   "git commit"
  abbr --add gcmm  "git commit -m"
  abbr --add gf    "git fetch"
  abbr --add gp    "git push"
  abbr --add gpo   "git push origin"
  abbr --add gpom  "git push origin master"
  abbr --add gpl   "git pull"
  abbr --add gplo  "git pull origin"
  abbr --add gplom "git pull origin master"
  abbr --add gs    "git status"
  abbr --add gss   "git status -s"
end