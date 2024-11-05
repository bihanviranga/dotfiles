return {
  "christoomey/vim-tmux-navigator",
  "tpope/vim-surround",

  {
    "folke/noice.nvim",
    enabled = false,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/Documents/org//**/*",
        org_default_notes_file = "~/Documents/org/refile.org",
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
}
