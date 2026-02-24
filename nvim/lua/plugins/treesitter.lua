return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
          'rust',
          'python',
          'javascript',
          'typescript',
          'tsx',
          'json',
          'html',
          'css',
        },
        highlight = {
          enable = true,
        },
      }
    end,
  },
}
