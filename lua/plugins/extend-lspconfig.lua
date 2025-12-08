return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      -- Go: disable parameter placeholders (keeps parentheses)
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false,
          },
        },
      },
      -- TypeScript: disable function call completions from LSP, let blink.cmp add brackets
      vtsls = {
        settings = {
          complete_function_calls = false,
          typescript = {
            suggest = {
              completeFunctionCalls = false,
            },
          },
          javascript = {
            suggest = {
              completeFunctionCalls = false,
            },
          },
        },
      },
      -- Vue (Volar): same treatment
      volar = {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = false,
              },
            },
          },
        },
      },
    },
  },
}
