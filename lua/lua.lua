-- Configure treesitter
require'nvim-treesitter.configs'.setup {
  parser_install_dir = vim.fn.stdpath('config') .. '/parser',

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
