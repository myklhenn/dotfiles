# install fisherman and plugins in fishfile on first run
if not test -e ~/.config/fish/functions/fisher.fish
  # (TODO: what if curl isn't installed?)
  echo "Fisherman not found. Installing..."
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  # install packages in fishfile
  fisher
end