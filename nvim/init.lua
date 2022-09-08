
-- Config was built using the following config:
-- https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim/

local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')


o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 10

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- Better editing experience
--o.expandtab = false
--o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
-- BUG This option causes an error!
-- o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1
--
opt.mouse = "a"

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
g.floaterm_keymap_toggle = '<F12>'

require('lualine').setup()

-- COLORSCHEMES
-- Uncomment just ONE of the following colorschemes!
 local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-medium')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
--local ok, _ = pcall(vim.cmd, 'colorscheme base16-onedark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme palenight')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-light')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')


-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

A.nvim_create_autocmd('VimLeave', {command = "clear"})
 vim.api.nvim_command([[
augroup FileType python setlocal noexpandtab
augroup END 
]])

-- KEYBINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- nerd tree
map('n', '<F2>', ':NERDTreeToggle<CR>')
--map('i', '<C-F2>', ':NERDTreeToggle<CR>')

-- split creation
map('n' , '<leader>h' , ':sp<CR>' )
map('n' , '<leader>v' , ':vsp<CR>' )
-- split resize
map('n', '<C-h>', ':vertical resize -10 <CR>')
map('n', '<C-l>', ':vertical resize +10 <CR>')
map('n', '<C-k>', ':resize -10 <CR>')
map('n', '<C-j>', ':resize +10 <CR>')

--split navigation
map('n' , '<s-h>', ':wincmd h <CR>')
map('n' , '<s-l>', ':wincmd l <CR>')
map('n' , '<s-j>', ':wincmd j <CR>')
map('n' , '<s-k>', ':wincmd k <CR>')

-- tabs
map('n' , '<C-t>', ':tabnew <CR>')
map('n' , '<C-kPageUp>', ':tabn <CR>')
map('n' , '<C-kPageDown>', ':tabp <CR>')

--some standsrd editors bindings
map('n' , '<C-o>' , ':e')
map('n' , '<C-s>' , ':w <CR>')
map('n' , '<leader>s' , ':w <CR>')
map('n' , '<leader><return>' , ':terminal <CR>')

--moving lines
map('n' , '<C-P>' , ':m 0<CR>')
map('n' , '<C-O>' , ':m $<CR>')
map('n' , '<C-j>' , ':m .+1<CR>')
map('n' , '<C-k>' , ':m .-2<CR>')


--loaterm
--map('n' , '<F12>', ':FloatermToggle <CR>')

-- PLUGINS
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A better status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File management --
  use 'vifm/vifm.vim'
  use 'scrooloose/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'

  -- Productivity --
  --use 'vimwiki/vimwiki'
  --use 'jreybert/vimagit'

  -- Tim Pope Plugins --
  use 'tpope/vim-surround'

  -- Syntax Highlighting and Colors --
  use 'PotatoesMaster/i3-vim-syntax'
  use 'kovetskiy/sxhkd-vim'
  use 'vim-python/python-syntax'
  use 'ap/vim-css-color'

  -- Junegunn Choi Plugins --
  use 'junegunn/vim-emoji'

  -- Colorschemes
  use 'RRethy/nvim-base16'
  use 'kyazdani42/nvim-palenight.lua'

  -- Other stuff
  use 'frazrepo/vim-rainbow'
  use 'jiangmiao/auto-pairs'
  use 'valloric/youcompleteme'
  use 'neoclide/coc.nvim'

  use 'voldikss/vim-floaterm'

end)

