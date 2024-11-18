-- local wk = require "which-key"
local neotest_config = function()
  require('neotest').setup {
    adapters = {
      require 'neotest-vitest' {
        filter_dir = function(name, rel_path, root)
          return name ~= 'node_modules'
        end,
      },
      require 'neotest-dotnet',
      require 'neotest-golang',
    },
    consumers = {},
  }
  -- Define key mappings for neotest
  local map_opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(
    'n',
    '<leader>Tt',
    "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>",
    { noremap = true, silent = true, desc = 'Run test file' }
  )
  vim.api.nvim_set_keymap('n', '<leader>TT', "<cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>Tr', "<cmd>lua require('neotest').run.run()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>Tl', "<cmd>lua require('neotest').run.run_last()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>Ts', "<cmd>lua require('neotest').summary.toggle()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>To', "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>TO', "<cmd>lua require('neotest').output_panel.toggle()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>TS', "<cmd>lua require('neotest').run.stop()<CR>", map_opts)
  vim.api.nvim_set_keymap('n', '<leader>Twr', "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch' })
  vim.api.nvim_set_keymap(
    'n',
    '<leader>Twf',
    "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), vitestCommand = 'vitest --watch'})<CR>",
    { noremap = true, silent = true, desc = 'Run Watch File' }
  )
end

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
    'Issafalcon/neotest-dotnet',
    'fredrikaverpil/neotest-golang',
  },
  config = neotest_config,
}
