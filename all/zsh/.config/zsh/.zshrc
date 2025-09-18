autoload colors && colors

# load antidote and plugins
source "$AD_CMD"
zstyle ':antidote:bundle' use-friendly-names on
zstyle ':antidote:bundle' file "$AD_PLUGIN_LIST"
zstyle ':antidote:static' file "$AD_PLUGIN_FILE"
antidote load

# load antibody plugins
# source "$AB_PLUGIN_FILE"

# load brew package paths on macOS
[ -d /opt/homebrew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# (abbreviations file will be recreated from config files)
cat /dev/null > "$ZABBRS"

# load config files in "conf.d" directory
for conf_file in "$ZCONFDIR"/*.zsh; do source $conf_file; done

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

_zsh_add_shortcuts --abbr \
    '..    % cd ..' \
    '...   % cd ../..' \
    '....  % cd ../../..' \
    'c     % clear' \
    'q     % exit'

_zsh_add_shortcuts \
    "src      % exec $SHELL" \
    'env      % formatted_env' \
    "dotlink  % $DOTFILES/link.sh"
