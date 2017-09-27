# FISH SHELL CONFIGURATION
# executed upon session start, and when 'reload' is called

# verbose output functions
function use_color; isatty stdout; and set_color $argv[1]; end
function lgn; if test -n "$RELOADING"; echo $argv[1]; end; end
function lg; if test -n "$RELOADING"; echo -n $argv[1]; end; end
function INFO; use_color yellow; lg "    "$argv[1]; lgn; use_color normal; end
function NAME; use_color cyan; lg $argv[1]" "; use_color normal; end

#####

set fish_greeting #blank greeting

lg "setting environment variables..."

set -x EDITOR (if test (which nvim); echo nvim; else; echo vim; end)
set -x GREP_COLOR "1;37;45"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
#set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /home/henninm3/.local/lib
# highlighting for less / man pages
set -x LESS_TERMCAP_mb (echo -e '\e[01;31m') # mode-blinking -- red
set -x LESS_TERMCAP_md (echo -e '\e[01;32m') # mode-doublebright -- bold, green
set -x LESS_TERMCAP_me (echo -e '\e[0m')     # mode-exit -- normal
set -x LESS_TERMCAP_so (echo -e '\e[01;34m') # standout -- blue
set -x LESS_TERMCAP_se (echo -e '\e[0m')     # standout-exit -- normal
set -x LESS_TERMCAP_us (echo -e '\e[04;93m') # underline-start -- yellow
set -x LESS_TERMCAP_ue (echo -e '\e[0m')     # underline-exit -- normal
#...

lgn "done"

#####

lgn "checking platform(s):"

if test (uname) = "Darwin"
    INFO "found macos"
    set srcs $srcs ~/.config/fish/functions/macos
    set paths $paths (cat ~/.config/fish/functions/macos/paths.fish)
else if test (uname) = "Linux"
    INFO "found linux"
    set srcs $srcs ~/.config/fish/functions/linux
    set paths $paths (cat ~/.config/fish/functions/linux/paths.fish)
else if test (whoami) = "henninm3"
    INFO "found wwu"
    set srcs $srcs ~/.config/fish/functions/wwu
    set paths $paths (cat ~/.config/fish/functions/wwu/paths.fish)
    
    # map caps lock key to escape
    xmodmap -e "clear Lock" 2>/dev/null
    xmodmap -e "keysym Caps_Lock = Escape" 2>/dev/null
end

if test -n (which git)
    INFO "found git"
    set srcs $srcs ~/.config/fish/functions/git
end

set srcs $srcs ~/.config/fish/functions/all

#####

lg "modifying PATH..."

for dir in $paths;
  test -d $dir;
    and test -z (string match $dir (string split ":" $PATH));
    and set -x PATH $PATH $dir;
end

lgn "done"

#####

for file in $srcs
    set dir (string split / "$file" | tail -1)
    lgn "sourcing functions for $dir:"; lg "    "
    source $file"/functions.fish"; lgn
    lgn "sourcing abbreviations for $dir:"; lg "    "
    source $file"/abbreviations.fish"; lgn
end

#####

lg "setting fish colors..."

# match ANSI colors specified by terminal
set -u fish_color_autosuggestion    brgrey
set -u fish_color_command           --bold red #magenta
set -u fish_color_comment           yellow
set -u fish_color_cwd               green
set -u fish_color_cwd_root          red
set -u fish_color_end               magenta
set -u fish_color_error             normal #red
set -u fish_color_escape            cyan
set -u fish_color_history_current   cyan
set -u fish_color_host              normal
set -u fish_color_match             cyan
set -u fish_color_normal            normal
set -u fish_color_operator          cyan
set -u fish_color_param             blue
set -u fish_color_quote             green
set -u fish_color_redirection       cyan
set -u fish_color_search_match      --background=magenta
set -u fish_color_selection         --background=magneta
set -u fish_color_user              green
set -u fish_color_valid_path        --underline
set -u fish_pager_color_completion  normal
set -u fish_pager_color_description brgrey
set -u fish_pager_color_prefix      cyan
set -u fish_pager_color_progress    cyan

lgn "done"

#####

lgn ""

# cleanup
set -e srcs
functions -e lg
functions -e lgn
functions -e INFO
functions -e NAME

# launch X server
#if test (tty) = '/dev/tty1'
#    exec startx
#end
