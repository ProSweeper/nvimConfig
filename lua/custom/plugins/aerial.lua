return {
  'stevearc/aerial.nvim',
  event = 'VeryLazy',
  cmd = {
    'AerialToggle',
    'AerialOpen',
    'AerialNavOpen',
    'AerialInfo',
    'AerialClose',
  },
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
    disable_max_lines = vim.g.big_file.lines,
    disable_max_size = vim.g.big_file.size,
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
  config = function(_, opts)
    require('aerial').setup(opts)
    -- HACK: The first time you opened aerial on a session, close all folds.
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Aerial: The first time its open on a session, close all folds.',
      callback = function()
        local is_aerial = vim.bo.filetype == 'aerial'
        local is_ufo_available = require('base.utils').is_available 'nvim-ufo'
        if is_ufo_available and is_aerial and vim.g.new_aerial_session == nil then
          vim.g.new_aerial_session = false
          require('aerial').tree_set_collapse_level(0, 0)
        end
      end,
    })
  end,
}
