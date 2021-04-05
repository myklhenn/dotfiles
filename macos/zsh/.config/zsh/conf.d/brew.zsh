_zsh_test_cmds 'brew' && _zsh_add_shortcuts --abbr \
    'bup      % brew update' \
    'bu       % brew upgrade' \
    'bi       % brew install' \
    'bl       % brew list' \
    'bo       % brew outdated' \
    'bin      % brew info' \
    'br       % brew uninstall' \
    'bun      % brew uninstall' \
    'bre      % brew reinstall' \
    'bs       % brew search' \
    'bd       % brew desc' \
    'bt       % brew tap' \
    'but      % brew untap' \
    'bco      % brew outdated --cask' \
    'bcu      % brew upgrade --cask' \
    'bci      % brew install --cask' \
    'bcl      % brew list --cask' \
    'bcin     % brew info --cask' \
    'bcr      % brew uninstall --cask' \
    'bcun     % brew uninstall --cask' \
    'bcre     % brew reinstall --cask' \
    'bcd      % brew desc --cask' \
    'bbd      % brew bundle dump' \
    'bbl      % brew bundle list' \
    'bbla     % brew bundle list --all' \
    'bbf      % brew bundle --file=' \
    'bblf     % brew bundle list --file=' \
    'bblaf    % brew bundle list --all --file='
