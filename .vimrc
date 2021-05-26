" Vundle {{{
 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

 " Cool status bar
 Plugin 'itchyny/lightline.vim'

 " Note taking with MD and HTML
 Plugin 'xolox/vim-notes'
 Plugin 'xolox/vim-misc'

 Plugin 'tpope/vim-commentary'

 Plugin 'tpope/vim-surround'

 Plugin 'tpope/vim-sensible'

 Plugin 'tpope/vim-fugitive'

 Plugin 'w0rp/ale'

 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'
 let g:UltiSnipsUsePythonVersion = 3

 Plugin 'ervandew/supertab'

 Plugin 'python-mode/python-mode'
 let g:pymode_python = 'python3'

 " plugin on GitHub repo
 " Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
 " Plugin 'L9'
 " Git plugin not hosted on GitHub
 " Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 " Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 " Plugin 'ascenator/L9', {'name': 'newL9'}

 " Nerdtree for file layout
 Plugin 'scrooloose/nerdtree'

 " Fuzzy file finder CTRL P
 Plugin 'kien/ctrlp.vim'

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line

" }}}

" Folding {{{
 set foldmethod=indent
 set foldlevel=0
 set modelines=1
" }}}

 " Sets {{{
 set nocompatible              " be iMproved, required
 filetype off                  " required

 set number relativenumber
 set nu rnu

 syntax on " Syntax highlighting

 set tabstop=4
 set softtabstop=4

 set expandtab

 set shiftwidth=4

 set cursorline " Highlight current line

 set wildmenu

 set foldenable
 set foldlevelstart=5

 set lazyredraw
 set nobackup " We have vcs, we don't need backups.
 set nowritebackup " We have vcs, we don't need backups.

 set ignorecase " case insensitive search
 set smartcase " If there are uppercase letters, become case-sensitive.
 set incsearch " live incremental searching
 set showmatch " live match highlighting
 set hlsearch " highlight matches

 set laststatus=2

 set autoread " Auto update when something else changes it

 set magic " Allows for more common regex

 " Don't have annoying sound on errors
 set noerrorbells

 set background=dark

 set smartcase " Be smart about searching with case

 set path+=** " Enable :find command to be recursive in the current directory

 set ai   " Auto indent
 set si   " Smart indent
 set wrap " Wrap lines

 set list listchars=trail:~,extends:> " Show trailing whitespace as ~

 let mapleader=" "

 if !has('gui_running')
   set t_Co=256
 endif

 set encoding=utf-8
 let g:notes_unicode_enabled = 1
" }}}

 " Remaps {{{
 inoremap jk <esc>

 nnoremap <CR> za

 nnoremap Y y$

 "split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 map <leader>n :NERDTreeToggle<CR>

 map <C-n> :NERDTreeToggle<CR>

 map <C-p> :CtrlP<CR>
" }}}

" Autocmds {{{
 autocmd BufRead,BufNewFile .vimrc set foldmethod=marker
" }}}

" Remove trailing whitespace {{{
 function! TrimWhiteSpace()
   %s/\s*$//
     ''
 endfunction

 autocmd FileWritePre * call TrimWhiteSpace()
 autocmd FileAppendPre * call TrimWhiteSpace()
 autocmd FilterWritePre * call TrimWhiteSpace()
 autocmd BufWritePre * call TrimWhiteSpace()
" }}}
