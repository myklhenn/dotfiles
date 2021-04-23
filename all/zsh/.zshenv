#!/bin/zsh

# environment variables exported for zsh
# (loaded before any zsh dot-files like .zshrc)

[[ "$TERM" == "linux" ]] || export TERM='xterm-256color'
export DOTFILES="$HOME/.dotfiles"

### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

### ZSH ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZCONFDIR="$ZDOTDIR/conf.d"
export ZABBRS="$ZDOTDIR/abbreviations"
export FAST_WORK_DIR=XDG
export HISTFILE="$ZDOTDIR/.zhistory" # History filepath
export HISTSIZE=10000                # Maximum events for internal history
export SAVEHIST=10000                # Maximum events in history file

### ANTIBODY ###
export AB_CONFIG="$XDG_CONFIG_HOME/antibody"
export AB_PLUGIN_LIST="$AB_CONFIG/bundles.txt" # List of antibody plugins
export AB_PLUGIN_FILE="$AB_CONFIG/bundles.sh"  # Static plugins file

### LOCALIZATION ###
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

### COLORS ###
export GREP_COLOR="1;37;45"
export LESS_TERMCAP_mb="$(print '\e[01;31m')" # mode-blinking (red)
export LESS_TERMCAP_md="$(print '\e[01;32m')" # mode-doublebright (bold, green)
export LESS_TERMCAP_me="$(print '\e[0m')"     # mode-exit (normal)
export LESS_TERMCAP_so="$(print '\e[01;34m')" # standout (blue)
export LESS_TERMCAP_se="$(print '\e[0m')"     # standout-exit (normal)
export LESS_TERMCAP_us="$(print '\e[04;93m')" # underline-start (yellow)
export LESS_TERMCAP_ue="$(print '\e[0m')"     # underline-exit (normal)

### PATH ###
export SCRIPTS="$HOME/.local/bin"
echo "$PATH" | grep "$SCRIPTS" > /dev/null || export PATH="$PATH:$SCRIPTS"
