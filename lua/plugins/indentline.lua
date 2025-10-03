return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    local highlight = {
      "IblRed",
      "IblYellow",
      "IblBlue",
      "IblPeach",
      "IblGreen",
      "IblMauve",
      "IblSky",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local success, c = pcall(require, "catppuccin.palettes.mocha")
      if not success then
        return
      end

      vim.api.nvim_set_hl(0, "IblRed", { fg = c.red })
      vim.api.nvim_set_hl(0, "IblYellow", { fg = c.yellow })
      vim.api.nvim_set_hl(0, "IblBlue", { fg = c.blue })
      vim.api.nvim_set_hl(0, "IblPeach", { fg = c.peach })
      vim.api.nvim_set_hl(0, "IblGreen", { fg = c.green })
      vim.api.nvim_set_hl(0, "IblMauve", { fg = c.mauve })
      vim.api.nvim_set_hl(0, "IblSky", { fg = c.sky })
    end)
    require("ibl").setup({ indent = { highlight = highlight } })
  end,
}
