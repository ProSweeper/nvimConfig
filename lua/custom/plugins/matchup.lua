return {
  'andymass/vim-matchup',
  event = 'VeryLazy',
  config = function()
    vim.g.matchup_matchparen_deferred = 1 -- work async
    vim.g.matchup_matchparen_offscreen = {} -- disable status bar icon
  end,
}
