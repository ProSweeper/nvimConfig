return {
  'nvim-pack/nvim-spectre',
  build = false,
  cmd = 'Spectre',
  opts = { open_cmd = 'noswapfile vnew', highlight = {
    ui = 'String',
    search = 'DiffChange',
    replace = 'DiffDelete',
  } },
}
