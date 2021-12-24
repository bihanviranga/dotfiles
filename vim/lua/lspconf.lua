local nvim_lsp = require('lspconfig')

-- Only maps these keys after the language server attaches
-- to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }

  -- For more commands and documentation: ':help vim.lsp.*'
  buf_set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gy', '<CMD>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<CMD>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>.', '<CMD>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>od', '<CMD>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Completion plugin settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Pass the config to all servers
local servers = { 'eslint', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Auto format using eslint
vim.cmd([[autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll]])

-- Completion plugin settings continued
vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}
