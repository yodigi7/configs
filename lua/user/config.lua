local nvim_set_option = vim.api.nvim_set_option
local nvim_cmd = vim.api.nvim_command

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

nvim_cmd([[
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

syntax on

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

set smartindent " Smart indent

set list listchars=trail:~,extends:> " Show trailing whitespace as ~
]])

map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
map("n", "<CR>", "o<esc>")
map("n", "Y", "y$")
map("n", "<BS>", "hx")

-- Vimrc settings
map("n", "<leader>vv", ":split $MYVIMRC<CR>")
map("n", "<leader>vo", ":edit $MYVIMRC<CR>")
map("n", "<leader>vs", ":source $MYVIMRC<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.g.pymode_python = "python3" -- Using python3

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
