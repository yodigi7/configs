vim.call('plug#begin')
local Plug = vim.fn['plug#']
-- Use 'gx' to go to the github links
-- Plug 'https://github.com/glepnir/dashboard-nvim' -- Dashboard
-- https://github.com/unblevable/quick-scope
-- https://github.com/ervandew/supertab -- Overload tab to cycle through autocomplete
Plug 'https://github.com/mhinz/vim-startify' -- Alt dashboard
Plug 'https://github.com/honza/vim-snippets' -- General list of snippets
Plug 'https://github.com/morhetz/gruvbox' -- Gruvbox color scheme
Plug 'https://github.com/vim-airline/vim-airline' -- Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
Plug 'https://github.com/jiangmiao/auto-pairs' -- Auto open and close pairs
Plug 'https://github.com/liuchengxu/vim-which-key' -- Show options for keybindings when in progress
Plug 'https://github.com/lewis6991/gitsigns.nvim' -- Basic additional Git integration with sidebar
Plug 'https://github.com/vimwiki/vimwiki' -- Vim wiki
Plug 'https://github.com/tpope/vim-repeat' -- Allow plugins to work with dot command
Plug 'https://github.com/tpope/vim-surround' -- Surrounding ysw)
-- https://github.com/numToStr/Comment.nvim -- Alternative powerful commenter
Plug 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
Plug 'https://github.com/tpope/vim-fugitive' -- Git integration
Plug 'https://github.com/tpope/vim-projectionist' -- Jump from implementation to test files
Plug 'https://github.com/tpope/vim-dispatch' -- Dispatch built/test/etc jobs to async terminal

Plug 'https://github.com/kana/vim-textobj-entire' -- Around everything
Plug 'https://github.com/kana/vim-textobj-user' -- Requirement for around everything

Plug 'https://github.com/preservim/tagbar' -- Tagbar for code navigation
Plug('https://github.com/ternjs/tern_for_vim', {['do'] = 'yarn install --frozen-lockfile'}) -- Requirement for Tagbar

-- Telescope
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug('https://github.com/nvim-telescope/telescope.nvim', { tag = 'nvim-0.6' })
Plug 'https://github.com/nvim-telescope/telescope-project.nvim' -- TODO: look into removing as no longer needed

Plug 'https://github.com/ThePrimeagen/harpoon' --Harpoon

--CoC
Plug 'https://github.com/neoclide/coc.nvim'  -- Auto Completion
Plug('https://github.com/pappasam/coc-jedi', { ['do'] = 'yarn install --frozen-lockfile && yarn build', branch = 'main' })
-- TODO
Plug('https://github.com/yaegassy/coc-pydocstring', {['do'] = 'yarn install --frozen-lockfile'})

Plug 'https://github.com/voldikss/vim-floaterm' -- Floating terminal for reuse
-- https://github.com/numToStr/FTerm.nvim -- Floating terminal for nvim

vim.call('plug#end')

-- Gruvbox
vim.g.gruvbox_contrast_dark="hard"

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.g.pymode_python = "python3" -- Using python3

vim.o.number = true -- show number instead of 0 line number
vim.o.relativenumber = true -- use relative line numbers
vim.o.tabstop = 4 -- tabs to use 4 spaces
vim.o.softtabstop = 4 -- tabs to use 4 spaces
vim.o.shiftwidth = 4 -- > to use 4 spaces
vim.o.expandtab = true -- expand tabs to spaces

vim.o.cursorline = true -- show cursorline for which line currently on

vim.o.lazyredraw = true -- don't redraw screen when executing things like macros
vim.o.backup = false
vim.o.writebackup = false

vim.o.ignorecase = true
vim.o.smartcase = true -- only care about case if searching with at least one upper
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.hlsearch = true

vim.o.mouse="a" -- allow mouse usage

vim.o.clipboard="unnamedplus" -- connect windows and linux clipboards

vim.o.autoread = true -- auto update file is changed outside of nvim

vim.o.magic = true -- magic search

vim.o.path = vim.o.path .. "**"

vim.o.smartindent = true -- smart indent when already on new line

vim.o.list = true -- show tabs, nbsp, and trailing spaces
vim.o.listchars = "trail:~,extends:>" -- Show trailing spaces as specific chars

vim.o.scrolloff=5 -- set option to give 5 lines of buffer above and below for scrolling

vim.api.nvim_command([[
syntax on
colorscheme gruvbox
]])
-- vim.api.nvim_command([[
-- set number relativenumber
-- set tabstop=4
-- set softtabstop=4
-- set shiftwidth=4
-- set expandtab

-- syntax on

-- set cursorline

-- set lazyredraw
-- set nobackup
-- set nowritebackup

-- set ignorecase
-- set smartcase
-- set incsearch
-- set showmatch
-- set hlsearch

-- set mouse=a

-- set clipboard=unnamedplus

-- set autoread

-- set magic

-- set path+=**

-- set smartindent

-- set list listchars=trail:~,extends:>

-- set scrolloff=5

-- colorscheme gruvbox

-- ]])

map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
-- map("n", "<CR>", "o<esc>")
map("n", "Y", "y$")
map("n", "<BS>", "hx")
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Vimrc settings
map("n", "<leader>vv", ":split $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vl", ":split ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})
map("n", "<leader>vlo", ":edit ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})
map("n", "<leader>vo", ":edit $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vs", ":source $MYVIMRC<CR>:source ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})

-- Telescope
local telescope = require'telescope'
telescope.load_extension("project")
telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {silent=true})
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {silent=true})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {silent=true})
map("", "<leader>p", "<cmd>lua<space>require'telescope'.extensions.project.project{}<CR>", {silent=true})
map("n", "<leader>fgs", "<cmd>lua<space>require'telescope.builtin'.git_status{}<CR>", {silent=true})
map("n", "<leader>fgc", "<cmd>lua<space>require'telescope.builtin'.git_commits{}<CR>", {silent=true})
map("n", "<leader>fgb", "<cmd>lua<space>require'telescope.builtin'.git_branches{}<CR>", {silent=true})

-- Gitsigns
require('gitsigns').setup{
    current_line_blame = true,
    numhl = true,

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        map('n', '<leader>gh', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>gh', ':Gitsigns stage_hunk<CR>')
    end
}

-- Fugitive
map("n", "<leader>gp", ":Git push<CR>")
map("n", "<leader>gg", ":Git<CR>", {silent=true})
map("n", "<leader>gs", ":Git<CR>", {silent=true})
map("n", "<leader>gc", ":Git commit<CR>", {silent=true})
map("n", "<leader>gf", ":Git fetch<CR>", {silent=true})
map("n", "<leader>gr", ":Git reset --hard")
map("n", "<leader>go", ":Git checkout<space>")
map("n", "<leader>ga", ":Git add<space>")

-- Projectionist
map("n", "<leader>a", ":A<CR>", {silent=true})

-- Which key
map("n", "<leader>", "<cmd>WhichKey '<Space>'<CR>", {silent = true})

-- Harpoon
map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent=true})
map("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent=true})
map("n", "<tab>", ":lua require('harpoon.ui').nav_next()<CR>", {silent=true})
map("n", "<S-tab>", ":lua require('qharpoon.ui').nav_prev()<CR>", {silent=true})

-- Floaterm
map("n", "<leader>tt", ":FloatermToggle<CR>", {silent=true})
map("n", "<leader>tn", ":FloatermNew<CR>", {silent=true})
map("t", "<esc>", '<C-\\><C-n>:FloatermToggle<CR>', {silent=true})
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- Tagbar
map("n", "<F8>", ":TagbarToggle fjc<CR>")

-- CoC
map("n", "]", "<Plug>(coc-diagnostic-next)", {silent=true})
map("n", "[", "<Plug>(coc-diagnostic-prev)", {silent=true})
vim.g.coc_global_extensions = { 'coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-pairs', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap', 'coc-lua' }

-- Coc explorer
map("n", "<leader>e", ":CocCommand explorer<CR>")

-- Coc snippets
map("n", "<leader>cs", ":CocCommand snippets.editSnippets<CR>")


-- Coc markdown preview
map("n", "<leader>m", ":CocCommand markdown-preview-enhanced.openPreview<CR>")

-- Netrw for browser
vim.g.netrw_browsex_viewer="cmd.exe /C start" -- can now press 'gx' on link and will open in browser tab, for wsl

-- Vim wiki
vim.g.vimwiki_list = {{syntax = 'markdown', ext = '.md'}}

-- Startify
map("n", "<leader>ss", ":SSave<CR>")
map("n", "<leader>sc", ":SClose<CR>")
vim.g.startify_bookmarks = {
    {w = '/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_webhook'},
    {b = '/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_batch'},
    {n = '~/.config/nvim'},
    {vw = '~/vimwiki/index.md'},
    {s = '~/vimwiki/work/Standup.md'},
    {k = '/mnt/c/Users/anthony.buchholz/Projects/kattis'},
    {j = '/mnt/c/Users/anthony.buchholz/Projects/jolly-jackalopes'},
}
vim.g.startify_lists = {
    {type = 'sessions', header ={  '   Sessions' }},
    {type = 'bookmarks', header ={  '   Bookmarks' }},
    {type = 'files', header ={  '   MRU' }},
    {type = 'dir', header = { '   MRU in '  .. vim.fn.getcwd()}},
}
vim.g.startify_change_to_vcs_root = 1
