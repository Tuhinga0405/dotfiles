require 'core.options'
require 'core.keymaps'
require 'core.terminal'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
})

vim.opt.fillchars='eob: ' --removes ~
vim.opt.colorcolumn = "75"
vim.cmd("colorscheme retrobox")

--treesitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 
        'python', 'c', 'lua',  
        'dockerfile', 
        'html',
        'css',
        'cpp',
        'bash',
    },

  callback = function() vim.treesitter.start() end,
})

-- langmap
vim.opt.langmap = {
  'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  'фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',
  'Ё\\";~`',
  'ё\\";~`'
}
