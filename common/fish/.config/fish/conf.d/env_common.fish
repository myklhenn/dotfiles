# set fish environment variables on all platforms

set -x EDITOR (if test (which nvim); echo nvim; else; echo vim; end)
set -x PAGER (if test (which less); echo less; else; echo ''; end)
set -x GREP_COLOR "1;37;45"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# highlighting for less / man pages
set -x LESS_TERMCAP_mb (echo -e '\e[01;31m') # mode-blinking -- red
set -x LESS_TERMCAP_md (echo -e '\e[01;32m') # mode-doublebright -- bold, green
set -x LESS_TERMCAP_me (echo -e '\e[0m')     # mode-exit -- normal
set -x LESS_TERMCAP_so (echo -e '\e[01;34m') # standout -- blue
set -x LESS_TERMCAP_se (echo -e '\e[0m')     # standout-exit -- normal
set -x LESS_TERMCAP_us (echo -e '\e[04;93m') # underline-start -- yellow
set -x LESS_TERMCAP_ue (echo -e '\e[0m')     # underline-exit -- normal