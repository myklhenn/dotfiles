# fish shell functions sourced when running linux on a WWU lab machine

# open file in Visual Studio Code when installed in home directory
NAME "code"; function code
    ~/.local/bin/vscode/bin/code $argv
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

# SPRING 2017 COURSE FOLDER ALIASES:
NAME "345"; function 345
  cd ~/Documents/CSCI345
end

NAME "367"; function 367
  cd ~/Documents/CSCI367
end

NAME "403"; function 403
  cd ~/Documents/CSCI403
end

NAME "491"; function 491
  cd ~/Documents/CSCI491
end
