require('user.plugins') -- Installs all of the plugins from packer
require('user.autocmds') -- Setup all autocmds
local vim = vim -- Only show error 'Undefined global vim' on this top line

-- Gruvbox
vim.g.gruvbox_contrast_dark="hard"

-- Functional wrapper for mapping custom keybindings
-- See :h map-arguments
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.g.pymode_python = "python3" -- Using python3

-- Setting options
vim.opt.number = true -- show number instead of 0 line number
vim.opt.relativenumber = true -- use relative line numbers
vim.opt.tabstop = 4 -- tabs to use 4 spaces
vim.opt.softtabstop = 4 -- tabs to use 4 spaces
vim.opt.shiftwidth = 4 -- > to use 4 spaces
vim.opt.expandtab = true -- expand tabs to spaces

vim.opt.cursorline = true -- show cursorline for which line currently on

vim.opt.lazyredraw = true -- don't redraw screen when executing things like macros
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true -- only care about case if searching with at least one upper
vim.opt.showmatch = true

vim.opt.splitbelow = true -- Splits to the bottom by default on horizontal splits
vim.opt.splitright = true -- Splits to the right by default on vertical splits

vim.opt.mouse="a" -- allow mouse usage

vim.opt.clipboard="unnamedplus" -- connect windows and linux clipboards

vim.opt.autoread = true -- auto update file is changed outside of nvim

vim.opt.magic = true -- magic search

vim.opt.path:append("**")

vim.opt.smartindent = true -- smart indent when already on new line

vim.opt.list = true -- show tabs, nbsp, and trailing spaces
vim.opt.listchars = "trail:~,extends:>,tab:>-" -- Show trailing spaces as specific chars

vim.opt.scrolloff=5 -- set option to give 5 lines of buffer above and below for scrolling
vim.opt.gdefault = true -- auto add g flag to substitute all matches on line rather than just first
vim.opt.wrap = false -- don't wrap long text
vim.opt.laststatus=3

vim.cmd([[
colorscheme gruvbox
]])

-- Netrw for browser
vim.g.netrw_browsex_viewer="cmd.exe /C start" -- can now press 'gx' on link and will open in windows browser tab, for wsl

-- Mappings
map("i", "jk", "<esc>")
map("n", "<BS>", "hx")
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>wq", "<cmd>wq<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "Q", "<NOP>") -- Don't need Ex mode
map("n", "H", "<cmd>bprevious<CR>") -- Easier switching between buffers
map("n", "L", "<cmd>bnext<CR>") -- Easier switching between buffers
map("n", "<leader>bd", "<cmd>w<CR><cmd>bdelete!<CR>") -- Easy delete buffer
map("n", "<leader>h", "<cmd>noh<CR>") -- Quick noh
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Vimrc settings
map("n", "<leader>vv", "<cmd>split $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vo", "<cmd>edit $MYVIMRC<CR>", {silent=true})
map("n", "<leader>vp", "<cmd>split ~/.config/nvim/lua/plugins.lua<CR>", {silent=true})
map("n", "<leader>vs", "<cmd>PackerSync<CR>", {silent=true})
map("n", "<leader>vc", "<cmd>PackerClean<CR>", {silent=true})

-- Telescope
map("n", "<leader>ff", require'telescope.builtin'.find_files, {silent=true})
map("n", "<leader>fb", require'telescope.builtin'.buffers, {silent=true})
map("n", "<leader>fg", require'telescope.builtin'.live_grep, {silent=true})
map("n", "<leader>fh", require'telescope.builtin'.help_tags, {silent=true})
map("n", "<leader>fr", require'telescope.builtin'.registers, {silent=true})
map("n", "<leader>fk", require'telescope.builtin'.keymaps, {silent=true})
map("n", "<leader>fq", require'telescope.builtin'.quickfix, {silent=true})
map("n", "<leader>fgs", require'telescope.builtin'.git_status, {silent=true})
map("n", "<leader>fgc", require'telescope.builtin'.git_commits, {silent=true})
map("n", "<leader>fgb", require'telescope.builtin'.git_branches, {silent=true})

-- Fugitive
map("n", "<leader>gp", "<cmd>Git push<CR>")
map("n", "<leader>gg", "<cmd>Git<CR>", {silent=true})
map("n", "<leader>gs", "<cmd>Git<CR>", {silent=true})
map("n", "<leader>gc", "<cmd>Git commit<CR>", {silent=true})
map("n", "<leader>gcc", "<cmd>Git commit<CR>", {silent=true})
map("n", "<leader>gca", "<cmd>Git commit --amend<CR>", {silent=true})
map("n", "<leader>gf", "<cmd>Git fetch --prune<CR>", {silent=true})
map("n", "<leader>gr", ":Git reset --hard")
map("n", "<leader>go", ":Git checkout<space>")
map("n", "<leader>ga", ":Git add<space>")

-- Projectionist
map("n", "<leader>a", "<cmd>A<CR>", {silent=true})

-- Which key
require("which-key").register({
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
    s = {
        name = "session",
        s = "Save Session",
        c = "Save and Close Session",
        d = "Delete Session",
    },
    t = {
        name = "terminal",
        t = "Toggle terminal",
        n = "Create new terminal",
    },
    h = {
        name = "harpoon",
        a = "Add harpoon mark",
        h = "Toggle harpoon quick menu",
        t = "Toggle harpoon quick menu",
    },
    g = {
        name = "Git",
        p = "Git push",
        g = "Git status",
        s = "Git status",
        f = "Git fetch",
        r = "Git reset --hard",
        o = "Git checkout",
        a = "Git add",
        c = {
            name = "commit",
            a = "Git commit --amend",
            c = "Git commit"
        },
    },
    r = {
        name = "rename",
        n = "rename"
    },
    e = "explorer",
    c = {
        name = "create",
        s = "create snippet",
    },
    m = "open markdown preview",
    d = {
        d = "Run Dispatch",
        b = "Toggle debug point",
    },
    w = {
        name = "write file",
        q = "save and quit",
    },
    q = "quit file",
    b = {
        d = "delete buffer",
    },
    v = {
        name = "vim config",
        v = "open init.lua in split",
        o = "open init.lua in curr window",
    }
}, { prefix = "<leader>" })

-- Harpoon
map("n", "<leader>ha", require('harpoon.mark').add_file)
map("n", "<leader>hh", require('harpoon.ui').toggle_quick_menu, {silent=true})
map("n", "<leader>ht", require('harpoon.ui').toggle_quick_menu, {silent=true})
map("n", "<tab>", require('harpoon.ui').nav_next, {silent=true})
map("n", "<S-tab>", require('harpoon.ui').nav_prev, {silent=true})

-- Floaterm
map("n", "<leader>t", "<cmd>FloatermToggle<CR>", {silent=true})
-- map("n", "<leader>tt", "<cmd>FloatermToggle<CR>", {silent=true})
-- map("n", "<leader>tn", "<cmd>FloatermNew<CR>", {silent=true})
map("t", "<esc>", '<C-\\><C-n><cmd>FloatermToggle<CR>', {silent=true})

-- Tagbar
map("n", "<F8>", "<cmd>TagbarToggle fjc<CR>")

-- CoC
vim.g.coc_global_extensions = { 'coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap', 'coc-lua' }

vim.opt.updatetime=300 -- update stuff only after 300 ms of no typing -- maybe only has to do with swap file

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
map("n", "<leader>ef", "<cmd>CocCommand explorer --no-toggle<CR>")

-- Coc snippets
map("n", "<leader>cs", "<cmd>CocCommand snippets.editSnippets<CR>")

-- TODO: update to use lua
vim.cmd([[
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
augroup highlightUsages
autocmd!
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
]])

-- Coc markdown preview
map("n", "<leader>m", "<cmd>CocCommand markdown-preview-enhanced.openPreview<CR>")

-- Startify
map("n", "<leader>ss", "<cmd>SSave<CR>")
map("n", "<leader>sc", "<cmd>SClose<CR>")
map("n", "<leader>sd", "<cmd>SDelete<CR>")

-- Dispatch
map("n", "<leader>d", ":Dispatch<space>")
map("n", "<leader>dd", "<cmd>Dispatch<CR>")

-- Autopairs
map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

-- DAP - Debugger
map("n", "<leader>db", require('dap').toggle_breakpoint, {silent=true})
map("n", "<F1>", require('dap').continue, {silent=true})
map("n", "<F2>", require('dap').step_out, {silent=true})
map("n", "<F3>", require('dap').step_over, {silent=true})
map("n", "<F4>", require('dap').step_into, {silent=true})
map("n", "<F5>", require('dapui').toggle, {silent=true})

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
