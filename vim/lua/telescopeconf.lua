----------------------------------
-- Telescope config
----------------------------------
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('fzf')

-- Telescope key mappings
nmap("<C-p>", "<CMD>Telescope find_files<CR>")
nmap("<leader>p", "<CMD>Telescope buffers<CR>")
nmap("<leader>fb", "<CMD>Telescope file_browser<CR>")
nmap("<leader>ds", "<CMD>Telescope lsp_document_symbols<CR>")
nmap("<leader>dd", "<CMD>Telescope diagnostics<CR>")