local nvim_set_option = vim.api.nvim_set_option

vim.call('plug#begin')
local Plug = vim.fn['plug#']
Plug 'morhetz/gruvbox' -- Gruvbox color scheme
Plug 'vim-airline/vim-airline' -- Status bar
Plug 'ryanoasis/vim-devicons' -- Developer Icons
Plug 'jiangmiao/auto-pairs' -- Auto open and close pairs
Plug 'liuchengxu/vim-which-key' -- Show options for keybindings when in progress
Plug 'lewis6991/gitsigns.nvim' -- Basic additional Git integration with sidebar
Plug 'tpope/vim-surround' -- Surrounding ysw)
Plug 'tpope/vim-commentary' -- For Commenting gcc & gc
Plug 'tpope/vim-fugitive' -- Git integration
Plug 'tpope/vim-projectionist' -- Jump from implementation to test files
Plug 'tpope/vim-dispatch' -- Dispatch built/test/etc jobs to async terminal

Plug 'kana/vim-textobj-entire' -- Around everything
Plug 'kana/vim-textobj-user' -- Requirement for around everything

Plug 'preservim/tagbar' -- Tagbar for code navigation
Plug('ternjs/tern_for_vim', {['do'] = 'yarn install --frozen-lockfile'}) -- Requirement for Tagbar

Plug 'xolox/vim-misc' -- Requirement for vim notes
Plug 'xolox/vim-notes' -- Note taking

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = 'nvim-0.6' })
Plug 'nvim-telescope/telescope-project.nvim'

Plug 'ThePrimeagen/harpoon' --Harpoon

--CoC
Plug 'neoclide/coc.nvim'  -- Auto Completion
Plug('pappasam/coc-jedi', { ['do'] = 'yarn install --frozen-lockfile && yarn build', branch = 'main' })
-- TODO
-- Plug('Lap1n/coc-projector', {['do'] = 'yarn install --frozen-lockfile && yarn build' })
Plug('yaegassy/coc-pydocstring', {['do'] = 'yarn install --frozen-lockfile'})

Plug 'voldikss/vim-floaterm' -- Floating terminal for reuse

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

vim.api.nvim_command([[
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

syntax on

set cursorline

set lazyredraw
set nobackup
set nowritebackup

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set mouse=a

set clipboard=unnamedplus

set autoread

set magic

set path+=**

set smartindent

set list listchars=trail:~,extends:>

colorscheme gruvbox

]])

map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
map("n", "<CR>", "o<esc>")
map("n", "Y", "y$")
map("n", "<BS>", "hx")

-- Vimrc settings
map("n", "<leader>vv", ":split $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vl", ":split ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})
map("n", "<leader>vo", ":edit $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vs", ":source $MYVIMRC<CR>", {silent=true})

-- Telescope project
require'telescope'.load_extension("project")
local telescope = require'telescope'
telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {silent=true})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {silent=true})
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {silent=true})
map("", "<leader>p", "<cmd>lua<space>require'telescope'.extensions.project.project{}<CR>", {silent=true})

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
map("n", "<leader>gb", ":Git branch<CR>", {silent=true})
map("n", "<leader>grs", ":Git reset --hard")
map("n", "<leader>go", ":Git checkout<space>")
map("n", "<leader>ga", ":Git add<space>")

-- Projectionist
map("n", "<leader>a", ":A<CR>", {silent=true})

-- Notes
map("n", "<leader>na", ":split note:")
map("n", "<leader>nd", ":DeleteNote<space>")
map("n", "<leader>nr", ":RecentNotes<CR>", {silent = true})
map("n", "<leader>nn", ":split note:standup<CR>", {silent = true})

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
vim.g.coc_global_extensions = { 'coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-pairs', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap' }

-- Coc explorer
map("n", "<leader>e", ":CocCommand explorer<CR>")

-- Coc markdown preview
map("n", "<leader>m", ":CocCommand markdown-preview-enhanced.openPreview<CR>")
