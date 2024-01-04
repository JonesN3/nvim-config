--[[
  - https://learnxinyminutes.com/docs/lua/
  - https://neovim.io/doc/user/lua-guide.html
--]]

-- Set <space> as the leader key, must happend before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- imports from lua/plugins
require('lazy').setup({
 { import = 'plugins' },
}, {})

require('config.options')

require('config.telescope')
require('config.treesitter')

-- Required which_key already configured
require('config.lsp')

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
require('config.cmp')
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
