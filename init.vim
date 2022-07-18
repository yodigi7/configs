call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/jiangmiao/auto-pairs' " Auto open and close pairs
Plug 'https://github.com/tpope/vim-fugitive' " Auto open and close pairs

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'nvim-0.6' }
Plug 'nvim-telescope/telescope-project.nvim'

"CoC
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
lua require('user/config')

set number relativenumber

set tabstop=4 " tabs are only 4 spaces
set softtabstop=4 " tabs are only 4 spaces
set shiftwidth=4 " > shifts by 4
set expandtab " Make tabs into spaces

set cursorline " Highlight current line

set lazyredraw " Only redraw once down with macros and whatever
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.

set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches

set mouse=a

set clipboard=unnamedplus

set autoread " Auto update when something else changes it

set magic " Allows forre common regex

set path+=** " Enable :find command to be recursive in the current directory

set smartindent   " Smart indent

set list listchars=trail:~,extends:> " Show trailing whitespace as ~

let g:pymode_python = 'python3' "Using python3

imap jk <esc>
nmap <CR> o<esc>
nmap Y y$
nmap <BS> hx
map <C-q> :terminal<CR>i
tmap <esc> <C-d>
" TODO: find the plugin that automatically does this
nmap dae ggdG
nmap yae ggyG
nmap cae ggcG
let mapleader = " "
syntax on

map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

function! TrimWhiteSpace()
  %s/\s*$//
     ''
endfunction

autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

" CoC
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Coc explorer
nmap <space>e :CocCommand explorer<CR>

" CoC pydocstring
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" CoC snippets
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/ultisnips']

" Telescope
let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring']
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
map <leader>p <cmd>lua<space>require'telescope'.extensions.project.project{}<CR>

" Fugitive
map <C-K> :Git push<CR>
map <C-k> :Git commit<CR>
