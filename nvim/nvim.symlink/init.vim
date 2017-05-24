colorscheme monokai
syntax on

" follow terminal background transparency
hi Normal ctermbg=none
highlight NonText ctermbg=none

" tab control
set expandtab           " insert spaces for <Tab>
set smarttab            " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4           " the visible width of tabs
set softtabstop=4       " edit as if the tabs are 4 characters wide
set shiftwidth=4        " number of spaces to use for indent and unindent
set shiftround          " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

set clipboard=unnamed   " use same clipboard as system

set ttyfast             " faster redrawing
set diffopt+=vertical
set laststatus=2        " show the status line all the time
set so=7                " set 7 lines to the cursors - when moving vertical

" set number            " show line numbers
set relativenumber      " show relative line numbers

set cursorline          " highlight current line
set wildmenu            " enhanced command line completion
set wildmode=list:longest " complete files like a shell
set hidden              " current buffer can be put into background
set showcmd             " show incomplete commands
set showmatch           " show matching braces
set mat=2               " how many tenths of a second to blink
set nocompatible        " not compatible with vi
set autoread            " detect when a file is changed
set history=1000        " change history to 1000
set scrolloff=3         " lines of text around cursor
set shell=$SHELL
set cmdheight=1         " command bar height
set title               " set terminal title

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wrap                " turn on line wrapping
"set wrapmargin=8        " wrap lines when coming within n characters from side
set linebreak           " set soft wrapping
set showbreak=...       " show ellipsis at breaking
set autoindent          " automatically set indent of new line
set smartindent

" toggle invisible characters
" set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

set rtp+=/usr/local/opt/fzf " use fzf for fuzzy file search

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" vim-plug preamble/plugin directory
call plug#begin('~/.vim/plugged')

"Plug 'arakashic/chromatica.nvim'
Plug 'brooth/far.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()
