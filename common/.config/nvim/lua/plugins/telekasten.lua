return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  opts = {
    home = vim.fn.expand("~/zettelkasten"),
  },
  keys = {
    {
      "<leader>tf",
      "<cmd>Telekasten find_notes<cr>",
      desc = "Search Notes",
    },

    {
      "<leader>td",
      "<cmd>Telekasten goto_today<cr>",
      desc = "Open Daily Note",
    },

    {
      "<leader>tn",
      "<cmd>Telekasten new_note<cr>",
      desc = "Create new note",
    },
    {
      "<leader>tt",
      "<cmd>Telekasten follow_link<cr>",
      desc = "Follow telekasten link",
    },
  },
}
