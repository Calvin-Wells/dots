vim.opt.title = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.autocomplete = true
vim.opt.list = true
vim.opt.listchars = "space:·,tab:> ,trail:-,nbsp:+"

local map = vim.keymap.set

vim.g.mapleader = " "
map('n', '<leader>o', ':update<CR>:source<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>p', '"+p<CR>')
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = 'https://github.com/NvChad/showkeys',                opt = true },
})

require "mason".setup()
require "showkeys".setup({ position = "top-right" })
require "nvim-treesitter.configs".setup({
  ensure_installed = { "typescript", "javascript", "css", "java", "rust", "bash", "python", "ruby" },
  highlight = { enable = true }
})
require "mini.pick".setup()
require "oil".setup()
require "gitsigns".setup()

map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.enable({ "lua_ls", "java-language-server", "python-lsp-server", "ruby-lsp", "rust-analyzer" })

-- Colours
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<leader>t', ":horizontal te<CR>")
