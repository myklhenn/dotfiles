# install fisher initial plugins for macos on first run
if not test -e $XDG_CONFIG_HOME/fish/conf.d/done.fish
    set -l PLUGINS \
        "franciscolourenco/done" \
        "laughedelic/brew-completions" \
        "oh-my-fish/plugin-osx" \
        "oh-my-fish/plugin-tab"

    fish -c "fisher add $PLUGINS"
end