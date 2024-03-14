return {
  'stevearc/aerial.nvim',
  opts = {
    filter_kind = { -- Symbols that will appear on the tree
      -- "Class",
      'Constructor',
      'Enum',
      'Function',
      'Interface',
      -- "Module",
      'Method',
      -- "Struct",
    },
    open_automatic = false, -- Open if the buffer is compatible
    autojump = true,
    link_folds_to_tree = false,
    link_tree_to_folds = false,
    attach_mode = 'global',
    backends = { 'lsp', 'treesitter', 'markdown', 'man' },
    layout = { min_width = 28 },
    show_guides = true,
    guides = {
      mid_item = '├ ',
      last_item = '└ ',
      nested_top = '│ ',
      whitespace = '  ',
    },
    keymaps = {
      ['[y'] = 'actions.prev',
      [']y'] = 'actions.next',
      ['[Y'] = 'actions.prev_up',
      [']Y'] = 'actions.next_up',
      ['{'] = false,
      ['}'] = false,
      ['[['] = false,
      [']]'] = false,
    },
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
