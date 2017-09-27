#!/usr/bin/env fish

which apm-beta; and set -l apmcmd apm-beta
which apm; and set -l apmcmd apm

# packages
eval $apmcmd install atom-ide-ui
eval $apmcmd install emmet
eval $apmcmd install file-icons
eval $apmcmd install highlight-line
eval $apmcmd install highlight-selected
eval $apmcmd install ide-cpp
eval $apmcmd install ide-css-less-scss
eval $apmcmd install ide-html
eval $apmcmd install ide-java
eval $apmcmd install ide-json
eval $apmcmd install ide-python
eval $apmcmd install ide-typescript
eval $apmcmd install language-fish-shell
eval $apmcmd install language-viml
eval $apmcmd install split-diff
# themes
eval $apmcmd install monokai
