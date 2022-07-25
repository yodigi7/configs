local vim = vim -- Only show error 'Undefined global vim' on this top line
-- TODO: migrate to packer https://github.com/wbthomason/packer.nvim
-- for profiling and speedups - https://github.com/lewis6991/impatient.nvim
vim.call('plug#begin')
local Plug = vim.fn['plug#']
-- Use 'gx' to go to the github links
-- Plug 'https://github.com/glepnir/dashboard-nvim' -- Dashboard
-- https://github.com/unblevable/quick-scope
-- https://github.com/ervandew/supertab -- Overload tab to cycle through autocomplete
-- https://github.com/NMAC427/guess-indent.nvim -- For determining tab style for file
-- https://github.com/PeterRincker/vim-argumentative -- For manipulating function arguments such as swapping position
-- https://github.com/L3MON4D3/LuaSnip -- Advanced snippet program
Plug 'https://github.com/akinsho/bufferline.nvim' -- Shows buffers as tabs in line like VSCode
Plug 'https://github.com/mhinz/vim-startify' -- Alt dashboard
Plug 'https://github.com/honza/vim-snippets' -- General list of snippets
Plug 'https://github.com/morhetz/gruvbox' -- Gruvbox color scheme
Plug 'https://github.com/vim-airline/vim-airline' -- Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
Plug 'https://github.com/windwp/nvim-autopairs' -- Auto open and close pairs
Plug 'https://github.com/folke/which-key.nvim' -- Show options for keybindings when in progress
-- Plug 'https://github.com/liuchengxu/vim-which-key'
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

-- DAP (Debugger)
Plug 'https://github.com/mfussenegger/nvim-dap'
-- List of adapters - https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
Plug 'https://github.com/mfussenegger/nvim-dap-python'
Plug 'https://github.com/leoluz/nvim-dap-go'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'https://github.com/theHamsta/nvim-dap-virtual-text'

-- Telescope
Plug 'https://github.com/nvim-lua/plenary.nvim' -- General utils for a lot of plug-ins
Plug('https://github.com/nvim-telescope/telescope.nvim', { tag = 'nvim-0.6' })

Plug 'https://github.com/ThePrimeagen/harpoon' --Harpoon

-- CoC
Plug 'https://github.com/neoclide/coc.nvim'  -- Auto Completion
Plug('https://github.com/pappasam/coc-jedi', { ['do'] = 'yarn install --frozen-lockfile && yarn build', branch = 'main' })
Plug('https://github.com/yaegassy/coc-pydocstring', {['do'] = 'yarn install --frozen-lockfile'})

Plug 'https://github.com/voldikss/vim-floaterm' -- Floating terminal for reuse
-- TODO: https://github.com/numToStr/FTerm.nvim -- Floating terminal for nvim

vim.call('plug#end')

-- Gruvbox
vim.g.gruvbox_contrast_dark="hard"

-- Functional wrapper for mapping custom keybindings
-- See :h map-arguments
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.g.pymode_python = "python3" -- Using python3

-- Setting options
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

-- vim.o.path = vim.o.path .. "**"
vim.opt.path:append("**")

vim.o.smartindent = true -- smart indent when already on new line

vim.o.list = true -- show tabs, nbsp, and trailing spaces
vim.o.listchars = "trail:~,extends:>" -- Show trailing spaces as specific chars

vim.o.scrolloff=5 -- set option to give 5 lines of buffer above and below for scrolling

vim.opt.laststatus=3

vim.api.nvim_command([[
syntax on
colorscheme gruvbox
]])

-- Mappings
map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
-- map("n", "<CR>", "o<esc>")
map("n", "Y", "y$")
map("n", "<BS>", "hx")
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "Q", "<NOP>") -- Don't need Ex mode
map("n", "H", "<cmd>bprevious<CR>") -- Easier switching between buffers
map("n", "L", "<cmd>bnext<CR>") -- Easier switching between buffers
map("n", "<leader>bd", "<cmd>bdelete<CR>") -- Easy delete buffer
map("n", "<leader>h", "<cmd>noh<CR>") -- Quick noh
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Auto source files if saving init.vim or config.lua
local vim_conf_group = vim.api.nvim_create_augroup("VimConfigGroup", {clear=true})
vim.api.nvim_create_autocmd("BufWrite", {
    pattern = { "*config.lua", "*init.vim" },
    group = vim_conf_group,
    callback = function ()
        vim.schedule(function ()
            package.loaded["user/config"] = nil
            vim.cmd(":source $MYVIMRC")
            print("Loaded config files for vim")
        end)
    end

})

-- Vimrc settings
map("n", "<leader>vv", "<cmd>split $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vl", "<cmd>split ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})
map("n", "<leader>vlo", "<cmd>edit ~/.config/nvim/lua/user/config.lua<CR>", {silent=true})
map("n", "<leader>vo", "<cmd>edit $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vs", "<cmd>lua package.loaded[\"user/config\"]=nil<CR><cmd>source $MYVIMRC<CR>", {silent=true})

            package.loaded["user/config"] = nil
-- map("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>", {silent=true})

-- Telescope
local telescope = require'telescope'
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {silent=true})
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {silent=true})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {silent=true})
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {silent=true})
map("n", "<leader>fr", "<cmd>lua<space>require'telescope.builtin'.registers{}<CR>", {silent=true})
map("n", "<leader>fk", "<cmd>lua<space>require'telescope.builtin'.keymaps{}<CR>", {silent=true})
map("n", "<leader>fq", "<cmd>lua<space>require'telescope.builtin'.quickfix{}<CR>", {silent=true})
map("n", "<leader>fgs", "<cmd>lua<space>require'telescope.builtin'.git_status{}<CR>", {silent=true})
map("n", "<leader>fgc", "<cmd>lua<space>require'telescope.builtin'.git_commits{}<CR>", {silent=true})
map("n", "<leader>fgb", "<cmd>lua<space>require'telescope.builtin'.git_branches{}<CR>", {silent=true})

-- Gitsigns
require('gitsigns').setup({
    current_line_blame = true,
    numhl = true,

    on_attach = function(bufnr)
        local function localmap(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        localmap('n', '<leader>gh', '<cmd>Gitsigns stage_hunk<CR>')
        localmap('v', '<leader>gh', '<cmd>Gitsigns stage_hunk<CR>')
    end
})
map('n', '<leader>gh', '<cmd>Gitsigns stage_hunk<CR>')
map('v', '<leader>gh', '<cmd>Gitsigns stage_hunk<CR>')

-- Fugitive
map("n", "<leader>gp", "<cmd>Git push<CR>")
map("n", "<leader>gg", "<cmd>Git<CR>", {silent=true})
map("n", "<leader>gs", "<cmd>Git<CR>", {silent=true})
map("n", "<leader>gc", "<cmd>Git commit<CR>", {silent=true})
map("n", "<leader>gf", "<cmd>Git fetch<CR>", {silent=true})
map("n", "<leader>gr", "<cmd>Git reset --hard")
map("n", "<leader>go", "<cmd>Git checkout<space>")
map("n", "<leader>ga", "<cmd>Git add<space>")

-- Projectionist
map("n", "<leader>a", "<cmd>A<CR>", {silent=true})

-- Which key
-- map("n", "<leader>", "<cmd>WhichKey '<Space>'<CR>", {silent = true})
local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
  f = {
    name = "file", -- optional group name
    f = "Find File",
    b = "Find Buffers",
    g = "Find with Grep",
    h = "Find Help Tags",
    q = "Find Quickfix",
    k = "Find Keymaps",
    r = "Find Registers",
  },
}, { prefix = "<leader>" })

-- Harpoon
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent=true})
map("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent=true})
map("n", "<tab>", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {silent=true})
map("n", "<S-tab>", "<cmd>lua require('qharpoon.ui').nav_prev()<CR>", {silent=true})

-- Floaterm
map("n", "<leader>tt", "<cmd>FloatermToggle<CR>", {silent=true})
map("n", "<leader>tn", "<cmd>FloatermNew<CR>", {silent=true})
map("t", "<esc>", '<C-\\><C-n><cmd>FloatermToggle<CR>', {silent=true})
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- Tagbar
map("n", "<F8>", "<cmd>TagbarToggle fjc<CR>")

-- CoC
vim.g.coc_global_extensions = { 'coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap', 'coc-lua' }

vim.o.updatetime=300 -- update stuff only after 300 ms of no typing

    -- TODO: Integrate this into the below mapping
    -- function check_back_space()
    --     local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    --     local linetext = vim.api.nvim_get_current_line()
    --     return col == 0 or string.match(linetext:sub(col, col), '%s') ~= nil
    -- end
    -- Overload tab to go next/previous on popup menu or next place in snippet
map("i", "<TAB>", [[ pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : CheckBackspace() ? "\<TAB>" : coc#refresh() ]], { silent = true, expr = true })
-- map("i", "<C-SPACE>", "coc#refresh()", {expr = true})
map("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], {expr = true})
map("i", "<CR>", [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"]], {silent = true, expr = true})

map("n", "]", "<Plug>(coc-diagnostic-next)", {silent=true, noremap=false})
map("n", "[", "<Plug>(coc-diagnostic-prev)", {silent=true, noremap=false})
map("n", "gd", "<Plug>(coc-definition)", {silent=true, noremap=false})
map("n", "gy", "<Plug>(coc-type-definition)", {silent=true, noremap=false})
map("n", "gi", "<Plug>(coc-implementation)", {silent=true, noremap=false})
map("n", "gr", "<Plug>(coc-references)", {silent=true, noremap=false})
map("n", "K", "<cmd>call ShowDocumentation()<CR>", { silent=true })
-- Symbol renaming.
map("n", "<leader>rn", "<Plug>(coc-rename)", { silent=true, noremap=false })


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map("x", "if", "<Plug>(coc-funcobj-i)", { noremap=false })
map("o", "if", "<Plug>(coc-funcobj-i)", { noremap=false })
map("x", "af", "<Plug>(coc-funcobj-a)", { noremap=false })
map("o", "af", "<Plug>(coc-funcobj-a)", { noremap=false })
map("x", "ic", "<Plug>(coc-classobj-i)", { noremap=false })
map("o", "ic", "<Plug>(coc-classobj-i)", { noremap=false })
map("x", "ac", "<Plug>(coc-classobj-a)", { noremap=false })
map("o", "ac", "<Plug>(coc-classobj-a)", { noremap=false })

-- CoC pydocstring
map("n", "ga", "<Plug>(coc-codeaction-line)", { silent=true })
map("x", "ga", "<Plug>(coc-codeaction-selected)", { silent=true })
map("n", "gA", "<Plug>(coc-codeaction)", { silent=true })

-- Coc explorer
map("n", "<leader>e", "<cmd>CocCommand explorer<CR>")

-- Coc snippets
map("n", "<leader>cs", "<cmd>CocCommand snippets.editSnippets<CR>")


-- Coc markdown preview
map("n", "<leader>m", "<cmd>CocCommand markdown-preview-enhanced.openPreview<CR>")

-- Netrw for browser
vim.g.netrw_browsex_viewer="cmd.exe /C start" -- can now press 'gx' on link and will open in windows browser tab, for wsl

-- Vim wiki
vim.g.vimwiki_list = {{syntax = 'markdown', ext = '.md'}}

-- Startify
map("n", "<leader>ss", "<cmd>SSave<CR>")
map("n", "<leader>sc", "<cmd>SClose<CR>")
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

-- Dispatch
map("n", "<leader>d", "<cmd>Dispatch<space>")
map("n", "<leader>dd", "<cmd>Dispatch<CR>")

-- Autopairs
local npairs = require("nvim-autopairs")
npairs.setup({
    map_cr = false
})
_G.MUtils= {}
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    return vim.fn["coc#_select_confirm"]()
  else
    return npairs.autopairs_cr()
  end
end
map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

-- DAP - Debugger
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", {silent=true})
map("n", "<F1>", "<cmd>lua require('dap').continue()<CR>", {silent=true})
map("n", "<F2>", "<cmd>lua require('dap').step_out()<CR>", {silent=true})
map("n", "<F3>", "<cmd>lua require('dap').step_over()<CR>", {silent=true})
map("n", "<F4>", "<cmd>lua require('dap').step_into()<CR>", {silent=true})
map("n", "<F5>", "<cmd>lua require('dapui').toggle()<CR>", {silent=true})

local dap, dapui = require("dap"), require("dapui")
require("dap-go").setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
    -- Node JS Setup
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

-- Bufferline
require('bufferline').setup({diagnostics = "coc"})
map("n", "H", ":BufferLineCyclePrev<CR>", {silent=true})
map("n", "L", ":BufferLineCycleNext<CR>", {silent=true})
