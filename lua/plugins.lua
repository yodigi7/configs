vim = vim -- Gets rid of eroneous warnings in linting
local programming_languages = {'java', 'python', 'javascript', 'go', 'lua'} -- Add additional coding filetypes here
return require('packer').startup(function(use)
    use 'https://github.com/wbthomason/packer.nvim'
    -- 'gx' to go to the github links
    use {
        'https://github.com/glepnir/dashboard-nvim',
        disable = true,
    } -- Dashboard -- TODO: Missing multiple sessions easy open
    use {
        'https://github.com/unblevable/quick-scope',
        config = function()
            vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
            vim.g.qs_filetype_blacklist = { 'startify' }
        end
    }
    use {
        'https://github.com/ervandew/supertab', -- Overload tab to cycle through autocomplete
        disable = true,
    }
    use {
        'https://github.com/L3MON4D3/LuaSnip',
        disable = true,
    } -- Advanced snippet program
    -- If want more in-depth changing of buffers/tabs line
    use {
        'https://github.com/akinsho/bufferline.nvim',
        disable = true,
    } -- Shows buffers as tabs in line like VSCode
    use {
        'https://github.com/NMAC427/guess-indent.nvim',
        config = function() require('guess-indent').setup{} end,
    } -- For determining tab style for file
    use {
        'https://github.com/PeterRincker/vim-argumentative',
        ft = programming_languages,
    } -- For manipulating function arguments such as swapping position
    use { 'https://github.com/nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'https://github.com/wellle/targets.vim' -- Add new text objects such as din{ to find next instance of {} and to delete everything inside
    -- TODO: Add back if ; can work with normal f
    use {
        'https://github.com/justinmk/vim-sneak',
        disable = true,
        config = "vim.g['sneak#label'] = true", -- Make it similar to easymotion after first hit
    } -- Sneak command to do f but with 2 chars
    use {
        'https://github.com/mhinz/vim-startify',
        config = function()
            vim.g.startify_bookmarks = {
                {w = '/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_webhook'},
                {b = '/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_batch'},
                {o = '/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_orch'},
                {n = '~/.config/nvim'},
                {vw = '~/vimwiki/index.md'},
                {s = '~/vimwiki/work/Standup.md'},
                {p = '~/vimwiki/work/Passwords.md'},
                {k = '/mnt/c/Users/anthony.buchholz/Projects/kattis'},
                {j = '/mnt/c/Users/anthony.buchholz/Projects/jolly-jackalopes'},
                {l = '/mnt/c/Users/anthony.buchholz/EAP-7.2.0/standalone/log/server.log'}
            }
            vim.g.startify_lists = {
                {type = 'sessions', header ={  '   Sessions' }},
                {type = 'bookmarks', header ={  '   Bookmarks' }},
                {type = 'files', header ={  '   MRU' }},
                {type = 'dir', header = { '   MRU in '  .. vim.fn.getcwd()}},
            }
            vim.g.startify_change_to_vcs_root = 1
        end
    } -- Alt dashboard
    use 'https://github.com/honza/vim-snippets' -- General list of snippets
    use 'https://github.com/gruvbox-community/gruvbox' -- Updated gruvbox color scheme -- original: 'https://github.com/morhetz/gruvbox'
    use {
        'https://github.com/vim-airline/vim-airline',
        config = function()
            vim.g["airline#extensions#tabline#enabled"] = true -- Enable bufferline
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
        end
    } -- Status bar
    use 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
    use {
        'https://github.com/windwp/nvim-autopairs',
        config = function()
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
        end
    } -- Auto open and close pairs
    use 'https://github.com/folke/which-key.nvim' -- Show options for keybindings when in progress
    use {
        'https://github.com/lewis6991/gitsigns.nvim',
        config = function()
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
        end
    } -- Basic additional Git integration with sidebar
    use {
        'https://github.com/vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {{syntax = 'markdown', ext = '.md'}}
        end
    } -- Vim wiki
    use 'https://github.com/tpope/vim-repeat' -- Allow plugins to work with dot command
    use 'https://github.com/tpope/vim-surround' -- Surrounding ysw)
    use {
        'https://github.com/numToStr/Comment.nvim',
        disable = true,
    } -- TODO: checkout -- Alternative powerful commenter
    use 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
    use 'https://github.com/tpope/vim-fugitive' -- Git integration
    use {
        'https://github.com/tpope/vim-projectionist',
        ft = programming_languages,
    } -- Jump from implementation to test files
    use {
        'https://github.com/tpope/vim-dispatch',
        cmd = {'Dispatch', 'Make'},
        config = function()
            local dispatch_map = {
                java = "mvn test",
                python = "pytest",
                javascript = "npm test",
            }
            local dispatch_group = vim.api.nvim_create_augroup("DispatchGroup", {clear=true})
            for language, command in pairs(dispatch_map) do
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = {language},
                    group = dispatch_group,
                    callback = function ()
                        vim.b.dispatch = command
                    end
                })
            end
        end
    } -- Dispatch built/test/etc jobs to async terminal

    use {
        'https://github.com/kana/vim-textobj-entire',
        requires = {{'https://github.com/kana/vim-textobj-user'}}
    } -- Around everything

    use {
        'https://github.com/preservim/tagbar',
        ft = programming_languages,
    } -- Tagbar for code navigation

    -- TODO: Move DAP config from init.lua to here
    -- DAP (Debugger)
    use {
        'https://github.com/mfussenegger/nvim-dap',
        -- ft = programming_languages,
    }
    -- List of DAP adapters - use https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    use {
        'https://github.com/mfussenegger/nvim-dap-python',
        -- ft = 'python',
    }
    use {
        'https://github.com/leoluz/nvim-dap-go',
        -- ft = 'go',
    }
    use {
        'https://github.com/rcarriga/nvim-dap-ui',
        -- ft = programming_languages,
    }
    use {
        'https://github.com/theHamsta/nvim-dap-virtual-text',
        -- ft = programming_languages,
    }
    use 'https://github.com/nvim-lua/plenary.nvim' -- General utils for a lot of plug-ins

    -- Telescope
    use {
        'https://github.com/nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {{'https://github.com/nvim-lua/plenary.nvim'}},
    }

    use {
        'https://github.com/ThePrimeagen/harpoon',
        requires = {{'https://github.com/nvim-lua/plenary.nvim'}},
    } --Harpoon

    -- CoC
    use {
        'https://github.com/neoclide/coc.nvim',
        branch = 'release',
        config = function()
            vim.g.coc_global_extensions = { 'coc-snippets', 'coc-explorer', 'coc-tsserver', 'coc-rome', 'coc-pyright', 'coc-json', 'coc-jedi', 'coc-java', 'coc-pydocstring', 'coc-go', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap', 'coc-lua' }

            vim.opt.updatetime=300 -- update stuff only after 300 ms of no typing
        end,
    } -- Auto Completion

    use {
        'https://github.com/voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_width = 0.9
            vim.g.floaterm_height = 0.9
        end
    } -- Floating terminal for reuse
end)
