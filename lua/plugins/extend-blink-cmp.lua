return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion = opts.completion or {}
    opts.completion.accept = opts.completion.accept or {}
    opts.completion.accept.auto_brackets = {
      enabled = true,
      default_brackets = { "(", ")" },
      override_brackets_for_filetypes = {},
      kind_resolution = {
        enabled = true,
        blocked_filetypes = {},
      },
      semantic_token_resolution = {
        enabled = true,
        blocked_filetypes = {},
        timeout_ms = 400,
      },
    }
    return opts
  end,
}
