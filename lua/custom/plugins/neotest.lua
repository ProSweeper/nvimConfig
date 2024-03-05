-- local wk = require "which-key"
local neotest_config = function()
  require('neotest').setup {
    adapters = {
      require 'neotest-vitest' {
        filter_dir = function(name, rel_path, root)
          return name ~= 'node_modules'
        end,
      },
    },
    consumers = {},
  }
  -- Define key mappings for neotest
  local map_opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(
    'n',
    '<leader>tt',
    "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>",
    { noremap = true, silent = true, desc = 'Run test file' }
  )
  vim.api.nvim_set_keymap('n', '<leader>tT', "<cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>tr', "<cmd>lua require('neotest').run.run()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>tl', "<cmd>lua require('neotest').run.run_last()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>to', "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>tO', "<cmd>lua require('neotest').output_panel.toggle()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>tS', "<cmd>lua require('neotest').run.stop()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>twr', "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch' })
  vim.api.nvim_set_keymap(
    'n',
    '<leader>twf',
    "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), vitestCommand = 'vitest --watch'})<CR>",
    { noremap = true, silent = true, desc = 'Run Watch File' }
  )
end

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
  },
  config = neotest_config,
}
