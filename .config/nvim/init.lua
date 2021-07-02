---- General mappings
require('plugins')
require('keymappings')
require('settings')

-- Theme
vim.cmd('source ~/.config/nvim/vimscript/bliss.vim')

-- LSP
require('lsp')
-- TODO: this doesn't work for some reason 
require('nv-lspinstall')
require('nv-lspkind')
require('lsp.python-ls')
require('lsp.sql-ls')

-- Debug
require('nv-nvim-dap')

-- Plugins
require('nv-compe')
require('nv-autopairs')
require('nv-treesitter')
require('nv-nvimtree')
require('nv-indentline')
require('nv-barbar')
require('nv-colorizer')
require('nv-telescope')
require('nv-gitsigns')
require('nv-gitblame')
require('nv-dashboard')
require('nv-hop')
vim.cmd('source ~/.config/nvim/vimscript/nv-whichkey/init.vim')
require('nv-floaterm')
require('nv-dadbod')
require('nv-doge')
vim.cmd('source ~/.config/nvim/vimscript/slime.vim')
require('nv-comment')
require('nv-presence')
require('nv-utils')
vim.cmd('source ~/.config/nvim/vimscript/airline.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')


-- The commands below doesn't work with the dashboard.
--vim.cmd('highlight RedundantSpaces ctermbg=red guibg=#f29db4')
--vim.cmd('match RedundantSpaces /\\s\\+$/')
