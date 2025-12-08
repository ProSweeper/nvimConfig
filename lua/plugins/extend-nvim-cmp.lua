-- do not show placeholders in snippet for auto complete
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
  },
  init = function()
    -- Override capabilities to disable snippet support
    local lspconfig_util = require("lspconfig.util")
    local default_on_attach = lspconfig_util.on_setup
    lspconfig_util.on_setup = lspconfig_util.add_hook_before(default_on_attach, function(config)
      config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = false,
            },
          },
        },
      })
    end)
  end,
}
