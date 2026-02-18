-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Core
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.diagnostics'

-- Plugins
require 'config.lazy'
