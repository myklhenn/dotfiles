# install fisher and initial plugins on first run
if not functions -q fisher
    if not test (which curl)
        echo "Startup script \"fisher.fish\" requires \"curl\" to run."
        echo "Please install before next shell startup."
    else
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        echo "Fisher not found. Installing..."
        curl https://git.io/fisher --create-dirs -sLo \
            $XDG_CONFIG_HOME/fish/functions/fisher.fish
        # install initial packages
        set -l PLUGINS \
            # "b4b4r07/enhancd" \
            "barnybug/docker-fish-completion" \
            "danhper/fish-completion-helpers" \
            "danhper/fish-fastdir" \
            "danhper/fish-ssh-agent" \
            "jethrokuan/z" \
            # "jethrokuan/fzf" \
            "jorgebucaran/fish-getopts" \
            "jorgebucaran/fish-nvm" \
            "laughedelic/pisces" \
            "myklhenn/my-fish-prompt" \
            "oh-my-fish/plugin-archlinux" \
            "oh-my-fish/plugin-await" \
            "oh-my-fish/plugin-bang-bang" \
            "oh-my-fish/plugin-export" \
            "oh-my-fish/plugin-extract" \
            "oh-my-fish/plugin-hash" \
            "oh-my-fish/plugin-localhost" \
            "oh-my-fish/plugin-ssh" \
            # "oh-my-fish/plugin-sudope" \
            "oh-my-fish/plugin-technicolor" \
            "oh-my-fish/plugin-tiny" \
            "oh-my-fish/plugin-thefuck"

        fish -c "fisher add $PLUGINS"
    end
end