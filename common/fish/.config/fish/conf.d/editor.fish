# check if nvim or vim are installed (prefer nvim)
if test (which nvim)
  set -g VI_EDITOR "nvim"
  set -g VIM_PLUG_PATH ~/.config/nvim/autoload/plug.vim
else if test (which vim)
  set -g VI_EDITOR "vim"
  set -g VIM_PLUG_PATH ~/.vim/autoload/plug.vim
end

if test -n "$VI_EDITOR"
  # add abbreviations for launching primary editor
  set -l ABBRS 'n' 'nv' 'nvi' 'nvim' 'v' 'vi' 'vim'
  for ABBR in $ABBRS
    abbr --add $ABBR $VI_EDITOR
  end

  # install vim-plug and plugins in init.vim/.vimrc on first run
  if test -n "$VIM_PLUG_PATH"; and not test -e "$VIM_PLUG_PATH"
    echo "vim-plug not found. Installing..."
    curl -fLo "$VIM_PLUG_PATH" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # install plugins non-interactively
    nvim +'PlugInstall --sync' +qa
  end

  # cleanup
  set -e VI_EDITOR
  set -e VIM_PLUG_PATH
end