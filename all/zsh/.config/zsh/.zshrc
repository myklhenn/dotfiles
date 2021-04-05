autoload colors && colors

# load antibody plugins
source $AB_PLUGIN_FILE

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
    'src   % exec zsh'
