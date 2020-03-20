# TODO: how to get this to only run once?
# install fisher initial plugins for macos on first run
if not functions -q fisher
    set -l PLUGINS \
        "franciscolourenco/done" \
        "laughedelic/brew-completions" \
        "oh-my-fish/plugin-osx" \
        "oh-my-fish/plugin-tab"

    fish -c "fisher add $PLUGINS"
end