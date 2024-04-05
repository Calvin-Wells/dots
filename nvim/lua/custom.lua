-- Colours (very important)
require("bufferline").setup{}

-- All of this is for COC
local lspconfig = require('lspconfig')
local coq = require "coq" 
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>Q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>r', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end

-- npm i -g vscode-langservers-extracted svelte-language-server @tailwindcss/language-server intelephense pacman -S pyright typescript-language-server
local lsp_servers = {
    'cssls', -- https://github.com/hrsh7th/vscode-langservers-extracted
    'eslint', -- https://github.com/hrsh7th/vscode-langservers-extracted
    'html', -- https://github.com/hrsh7th/vscode-langservers-extracted
    'intelephense', -- https://intelephense.com/
    'jsonls', -- https://github.com/hrsh7th/vscode-langservers-extracted
    'pyright', -- https://github.com/microsoft/pyright
    'svelte', -- https://github.com/sveltejs/language-tools/tree/master/packages/language-server
    'tailwindcss', -- https://github.com/tailwindlabs/tailwindcss-intellisense
    'tsserver', -- https://github.com/typescript-language-server/typescript-language-server
    'jdtls', -- https://projects.eclipse.org/projects/eclipse.jdt.ls
    'lua_ls',
}

for _, lsp in ipairs(lsp_servers) do
    lspconfig[lsp].setup {
        coq.lsp_ensure_capabilities(),
    }
end


-- Treesitter configs, most important is ensure_installed
require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "java", "dockerfile", "markdown", "markdown_inline" },
    sync_install = false,
    hilight = { enable = true },
    indent = {enable = true },
}

