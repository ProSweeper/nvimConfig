return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules" },
        },
        grep = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules" },
        },
      },
    },
  },
}
