call plug#begin()

Plug 'vim-airline/vim-airline' " Status bar
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'jiangmiao/auto-pairs' " Auto open and close pairs
Plug 'liuchengxu/vim-which-key' " Show options for keybindings when in progress
Plug 'lewis6991/gitsigns.nvim' " Basic additional Git integration with sidebar
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-projectionist' " Jump from implementation to test files
Plug 'tpope/vim-dispatch' " Dispatch built/test/etc jobs to async terminal

Plug 'kana/vim-textobj-entire' " Around everything
Plug 'kana/vim-textobj-user' " Requirement for around everything

Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'ternjs/tern_for_vim', {'do': 'yarn install --frozen-lockfile'} " Requirement for Tagbar

Plug 'xolox/vim-misc' " Requirement for vim notes
Plug 'xolox/vim-notes' " Note taking

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'nvim-0.6' }
Plug 'nvim-telescope/telescope-project.nvim'

Plug 'ThePrimeagen/harpoon' "Harpoon

"CoC
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
" TODO
" Plug 'Lap1n/coc-projector', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}

Plug 'voldikss/vim-floaterm' " Floating terminal for reuse

call plug#end()
lua require('user/config')

" inoremap jk <esc>
" inoremap kj <esc>
" nnoremap <CR> o<esc>
" nnoremap Y y$
" nnoremap <BS> hx

" Vim settings
nnoremap <leader>vv :sp $MYVIMRC<CR>
nnoremap <leader>vo :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

function! TrimWhiteSpace()
  %s/\s*$//
     ''
endfunction

augroup trimwhitespace
    autocmd!
    autocmd FileWritePre * call TrimWhiteSpace()
    autocmd FileAppendPre * call TrimWhiteSpace()
    autocmd FilterWritePre * call TrimWhiteSpace()
    autocmd BufWritePre * call TrimWhiteSpace()
augroup END

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
augroup highlightUsages
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
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

" Coc
nmap <silent> ] <Plug>(coc-diagnostic-next)
nmap <silent> [ <Plug>(coc-diagnostic-prev)
let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-pairs']

" Coc explorer
nnoremap <leader>e :CocCommand explorer<CR>

" CoC pydocstring
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" CoC snippets
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/ultisnips']

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
map <leader>p <cmd>lua<space>require'telescope'.extensions.project.project{}<CR>

" Fugitive
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gb :Git branch<CR>
nnoremap <leader>grs :Git reset --hard
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>ga :Git add<space>

" Which key
nnoremap <silent> <leader> <cmd>WhichKey '<Space>'<CR>

" Tagbar
nnoremap <F8> :TagbarToggle fjc<CR>

" Floatterm
nnoremap <silent> <leader>tt :FloatermToggle<CR>
nnoremap <silent> <leader>tn :FloatermNew<CR>
tnoremap <silent> <esc> <C-\><C-n>:FloatermToggle<CR>

" Harpoon
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>ht :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <tab> :lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent> <S-tab> :lua require("harpoon.ui").nav_prev()<CR>

" Notes
nnoremap <leader>na :split note:
nnoremap <leader>nd :DeleteNote<space>
nnoremap <silent> <leader>nr :RecentNotes<CR>
nnoremap <silent> <leader>nn :Note standup<CR>

" Dispatch
augroup dispatch
    autocmd FileType java let b:dispatch = 'mvn test'
    autocmd FileType javascript let b:dispatch = 'npm test'
    autocmd FileType python let b:dispatch = 'npm test'
augroup END
nnoremap <leader>d :Dispatch<space>
nnoremap <leader>dd :Dispatch<CR>

" Projectionist
nnoremap <silent> <leader>a :A<CR>
" let g:projectionist_heuristics = json_decode(join(readfile(expand('~/.config/projections.json'))))

" Gitsigns
" nnoremap <leader>gh :Gitsigns stage hunk<CR>
" vnoremap <leader>gh :Gitsigns stage hunk<CR>
