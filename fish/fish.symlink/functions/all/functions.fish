# fish shell functions sourced for all platforms

# navigation shortcuts
NAME ".."    ; function ..    ; cd .. ; end
NAME "..."   ; function ...   ; cd ../.. ; end
NAME "...."  ; function ....  ; cd ../../.. ; end
NAME "....." ; function ..... ; cd ../../../.. ; end

NAME "fish_prompt"; source ~/.config/fish/functions/all/prompt.fish

# add functions/abbreviations directory to $dirstack
NAME "funcd"; function funcd
  pushd ~/.config/fish/functions
end

NAME "abbred-all"; function abbred-all
  eval $EDITOR ~/.config/fish/functions/all/abbreviations.fish
end

NAME "funced-all"; function funced-all
  eval $EDITOR ~/.config/fish/functions/all/functions.fish
end

NAME "prompted"; function prompted
  eval $EDITOR ~/.config/fish/functions/all/prompt.fish
end

NAME "confed"; function confed
  eval $EDITOR ~/.config/fish/config.fish
end

# reload fish configuration, with verbose output enabled
NAME "reload"; function reload
  set -g RELOADING "yes"
  source ~/.config/fish/config.fish
  set -e RELOADING
end
