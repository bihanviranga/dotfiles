----------------------------------
-- LSP config
----------------------------------
-- TODO: when using omnifunc with <c-x><c-o>, I have to use arrow keys
-- to navigate the list. How to change those keys?
local nvim_lsp = require('lspconfig')

-- Setup language servers
nvim_lsp.eslint.setup {}
nvim_lsp.tsserver.setup {}
-- On Windows with Git Bash, the above lines had to be change to:
--[[
nvim_lsp.eslint.setup {
  cmd = { "vscode-eslint-language-server.cmd", "--stdio" }
}
nvim_lsp.tsserver.setup {
  cmd = { "typescript-language-server.cmd", "--stdio" }
}
]]--

-- Java language server
-- For lombok settings, refer to nvim lsp docs for jdtls
nvim_lsp.jdtls.setup {}

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
          'love',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Global mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Map these keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})
