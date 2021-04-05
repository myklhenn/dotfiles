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
export HISTFILE="$ZDOTDIR/.zhistory"  # History filepath
export HISTSIZE=10000                 # Maximum events for internal history
export SAVEHIST=10000                 # Maximum events in history file

### ANTIBODY ###
export AB_CONFIG="$XDG_CONFIG_HOME/antibody"
export AB_PLUGIN_LIST="$AB_CONFIG/bundles.txt"  # List of antibody plugins
export AB_PLUGIN_FILE="$AB_CONFIG/bundles.sh"   # Static plugins file

### LOCALIZATION ###
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

### PATH ###
export SCRIPTS="$HOME/.local/bin"
[[ "$PATH" == *"$SCRIPTS"* ]] || export PATH="$PATH:$SCRIPTS"
