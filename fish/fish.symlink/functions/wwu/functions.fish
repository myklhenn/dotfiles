# fish shell functions sourced when running linux on a WWU lab machine

# open file in Visual Studio Code when installed in home directory
NAME "code"; function code
    ~/.local/bin/code/bin/code $argv
end

# open file in Atom Beta when installed in home directory
NAME "atom-beta"; function atom-beta
    ~/.local/bin/atom/atom $argv
end

# allow execution of fish shell scripts when installed in home directory
NAME "fish"; function fish
    ~/.local/bin/fish $argv
end

# fix wallpaper issues (on WWU lab machines)
NAME "fixwallpaper"; function fixwallpaper
    gsettings set org.gnome.settings-daemon.plugins.background active true
end

NAME "abbred-wwu"; function abbred-wwu
  eval $EDITOR ~/.config/fish/functions/wwu/abbreviations.fish
end

NAME "funced-wwu"; function funced-wwu
  eval $EDITOR ~/.config/fish/functions/wwu/functions.fish
end

# FALL 2017 COURSE FOLDER ALIASES:
NAME "342"; function 342
  cd ~/Documents/CSCI342
end

NAME "412"; function 412
  cd ~/Documents/CSCI412
end

NAME "492"; function 492
  cd ~/Documents/CSCI492
end
