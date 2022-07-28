-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    config = { '\27LJ\2\n‹\2\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\4\0)\1,\1=\1\5\0K\0\1\0\15updatetime\bopt\1\15\0\0\17coc-snippets\17coc-explorer\17coc-tsserver\rcoc-rome\16coc-pyright\rcoc-json\rcoc-jedi\rcoc-java\20coc-pydocstring\vcoc-go\21coc-markdownlint"coc-markdown-preview-enhanced\16coc-markmap\fcoc-lua\26coc_global_extensions\6g\bvim\0' },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\vsilent\2\fnoremap\2\nforce\15tbl_extend\bvimh\1\1\a\0\5\0\r3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0B\2\4\1\18\2\1\0'\4\4\0'\5\2\0'\6\3\0B\2\4\0012\0\0€K\0\1\0\6v!<cmd>Gitsigns stage_hunk<CR>\15<leader>gh\6n\0k\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\0\1\0\2\nnumhl\2\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\ny\0\0\2\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\5€6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\3€-\0\0\0009\0\4\0D\0\1\0K\0\1\0\0À\17autopairs_cr\24coc#_select_confirm\15pumvisible\afn\bvim\0…\1\1\0\4\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0004\2\0\0=\2\5\0016\1\5\0003\2\a\0=\2\6\0012\0\0€K\0\1\0\0\23completion_confirm\vMUtils\a_G\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nu\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\rstartify\26qs_filetype_blacklist\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  tagbar = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n…\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16unique_tail)airline#extensions#tabline#formatter'airline#extensions#tabline#enabled\6g\bvim\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-argumentative"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-argumentative",
    url = "https://github.com/PeterRincker/vim-argumentative"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make" },
    config = { "\27LJ\2\n,\0\0\2\1\3\0\0056\0\0\0009\0\1\0-\1\0\0=\1\2\0K\0\1\0\6À\rdispatch\6b\bvim˜\2\1\0\f\0\14\0\0275\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0005\4\5\0B\1\3\0026\2\6\0\18\4\0\0B\2\2\4H\5\r€6\a\1\0009\a\2\a9\a\a\a'\t\b\0005\n\t\0004\v\3\0>\5\1\v=\v\n\n=\1\v\n3\v\f\0=\v\r\nB\a\3\0012\5\0€F\5\3\3R\5ñK\0\1\0\rcallback\0\ngroup\fpattern\1\0\0\rFileType\24nvim_create_autocmd\npairs\1\0\1\nclear\2\18DispatchGroup\24nvim_create_augroup\bapi\bvim\1\0\3\15javascript\rnpm test\vpython\vpytest\tjava\rmvn test\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nZ\0\0\2\0\4\1\t6\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0\20floaterm_height\19floaterm_width\6g\bvim›³æÌ\25Ì™³ÿ\3\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-projectionist"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n¶\a\0\0\a\0\26\00086\0\0\0009\0\1\0004\1\v\0005\2\3\0>\2\1\0015\2\4\0>\2\2\0015\2\5\0>\2\3\0015\2\6\0>\2\4\0015\2\a\0>\2\5\0015\2\b\0>\2\6\0015\2\t\0>\2\a\0015\2\n\0>\2\b\0015\2\v\0>\2\t\0015\2\f\0>\2\n\1=\1\2\0006\0\0\0009\0\1\0004\1\5\0005\2\14\0005\3\15\0=\3\16\2>\2\1\0015\2\17\0005\3\18\0=\3\16\2>\2\2\0015\2\19\0005\3\20\0=\3\16\2>\2\3\0015\2\21\0004\3\3\0'\4\22\0006\5\0\0009\5\23\0059\5\24\5B\5\1\2&\4\5\4>\4\1\3=\3\16\2>\2\4\1=\1\r\0006\0\0\0009\0\1\0)\1\1\0=\1\25\0K\0\1\0 startify_change_to_vcs_root\vgetcwd\afn\15   MRU in \1\0\1\ttype\bdir\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vheader\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\19startify_lists\1\0\1\6lF/mnt/c/Users/anthony.buchholz/EAP-7.2.0/standalone/log/server.log\1\0\1\6j</mnt/c/Users/anthony.buchholz/Projects/jolly-jackalopes\1\0\1\6k2/mnt/c/Users/anthony.buchholz/Projects/kattis\1\0\1\6p ~/vimwiki/work/Passwords.md\1\0\1\6s\30~/vimwiki/work/Standup.md\1\0\1\avw\23~/vimwiki/index.md\1\0\1\6n\19~/.config/nvim\1\0\1\6oI/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_orch\1\0\1\6bJ/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_batch\1\0\1\6wL/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_webhook\23startify_bookmarks\6g\bvim\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  vimwiki = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\2\bext\b.md\vsyntax\rmarkdown\17vimwiki_list\6g\bvim\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring('\27LJ\2\n‹\2\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\4\0)\1,\1=\1\5\0K\0\1\0\15updatetime\bopt\1\15\0\0\17coc-snippets\17coc-explorer\17coc-tsserver\rcoc-rome\16coc-pyright\rcoc-json\rcoc-jedi\rcoc-java\20coc-pydocstring\vcoc-go\21coc-markdownlint"coc-markdown-preview-enhanced\16coc-markmap\fcoc-lua\26coc_global_extensions\6g\bvim\0', "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\vsilent\2\fnoremap\2\nforce\15tbl_extend\bvimh\1\1\a\0\5\0\r3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0B\2\4\1\18\2\1\0'\4\4\0'\5\2\0'\6\3\0B\2\4\0012\0\0€K\0\1\0\6v!<cmd>Gitsigns stage_hunk<CR>\15<leader>gh\6n\0k\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\0\1\0\2\nnumhl\2\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\1\t6\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0\20floaterm_height\19floaterm_width\6g\bvim›³æÌ\25Ì™³ÿ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\n¶\a\0\0\a\0\26\00086\0\0\0009\0\1\0004\1\v\0005\2\3\0>\2\1\0015\2\4\0>\2\2\0015\2\5\0>\2\3\0015\2\6\0>\2\4\0015\2\a\0>\2\5\0015\2\b\0>\2\6\0015\2\t\0>\2\a\0015\2\n\0>\2\b\0015\2\v\0>\2\t\0015\2\f\0>\2\n\1=\1\2\0006\0\0\0009\0\1\0004\1\5\0005\2\14\0005\3\15\0=\3\16\2>\2\1\0015\2\17\0005\3\18\0=\3\16\2>\2\2\0015\2\19\0005\3\20\0=\3\16\2>\2\3\0015\2\21\0004\3\3\0'\4\22\0006\5\0\0009\5\23\0059\5\24\5B\5\1\2&\4\5\4>\4\1\3=\3\16\2>\2\4\1=\1\r\0006\0\0\0009\0\1\0)\1\1\0=\1\25\0K\0\1\0 startify_change_to_vcs_root\vgetcwd\afn\15   MRU in \1\0\1\ttype\bdir\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vheader\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\19startify_lists\1\0\1\6lF/mnt/c/Users/anthony.buchholz/EAP-7.2.0/standalone/log/server.log\1\0\1\6j</mnt/c/Users/anthony.buchholz/Projects/jolly-jackalopes\1\0\1\6k2/mnt/c/Users/anthony.buchholz/Projects/kattis\1\0\1\6p ~/vimwiki/work/Passwords.md\1\0\1\6s\30~/vimwiki/work/Standup.md\1\0\1\avw\23~/vimwiki/index.md\1\0\1\6n\19~/.config/nvim\1\0\1\6oI/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_orch\1\0\1\6bJ/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_batch\1\0\1\6wL/mnt/c/Users/anthony.buchholz/My Documents/Hyundai/ai_smartchat_webhook\23startify_bookmarks\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\ny\0\0\2\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\5€6\0\0\0009\0\1\0009\0\3\0D\0\1\0X\0\3€-\0\0\0009\0\4\0D\0\1\0K\0\1\0\0À\17autopairs_cr\24coc#_select_confirm\15pumvisible\afn\bvim\0…\1\1\0\4\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0004\2\0\0=\2\5\0016\1\5\0003\2\a\0=\2\6\0012\0\0€K\0\1\0\0\23completion_confirm\vMUtils\a_G\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\n…\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16unique_tail)airline#extensions#tabline#formatter'airline#extensions#tabline#enabled\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\nu\0\0\2\0\6\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\rstartify\26qs_filetype_blacklist\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\2\bext\b.md\vsyntax\rmarkdown\17vimwiki_list\6g\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-projectionist', 'tagbar', 'vim-argumentative'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vim-projectionist', 'tagbar', 'vim-argumentative'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'vim-projectionist', 'tagbar', 'vim-argumentative'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-projectionist', 'tagbar', 'vim-argumentative'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-projectionist', 'tagbar', 'vim-argumentative'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
