# fish shell abbreviations sourced for brew

if test (which brew)
  __fish_load_abbrs \
    # alias   command
    "bup      % brew update" \
    "bu       % brew upgrade" \
    "bi       % brew install" \
    "bl       % brew list" \
    "bin      % brew info" \
    "br       % brew uninstall" \
    "bun      % brew uninstall" \
    "bre      % brew reinstall" \
    "bs       % brew search" \
    "bd       % brew desc" \
    "bt       % brew tap" \
    "but      % brew untap" \
    "bco      % brew cask outdated" \
    "bcu      % brew cask upgrade" \
    "bci      % brew cask install" \
    "bcl      % brew cask list" \
    "bcin     % brew cask info" \
    "bcr      % brew cask uninstall" \
    "bcun     % brew cask uninstall" \
    "bcre     % brew cask reinstall" \
    "bcd      % brew cask desc" \
    "bbd      % brew bundle dump" \
    "bbl      % brew bundle list" \
    "bbla     % brew bundle list --all" \
    "bbf      % brew bundle --file=" \
    "bblf     % brew bundle list --file=" \
    "bblaf    % brew bundle list --all --file="
end
