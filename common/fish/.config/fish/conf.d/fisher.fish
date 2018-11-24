# install fisher and plugins in fishfile on first run
if not functions -q fisher
    # (TODO: what if curl isn't installed?)
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    echo "Fisher not found. Installing..."
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    # install packages in fishfile
    fish -c fisher
end