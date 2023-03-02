<<<<<<< Updated upstream
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
require('nv-lsp-signature')
require('lsp.python-ls')
require('lsp.sql-ls')

-- Debug
require('nv-nvim-dap')
vim.fn.sign_define('DapBreakpoint', {text='ﴫ ', texthl='LspDiagnosticsSignError', linehl='', numhl=''})
require('nv-dap-ui')


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
--require('nv-which-key')
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
-- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

=======
require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.colorscheme"
-- vim.cmd('source ~/.config/nvim/vimscript/bliss.vim')
require "user.catppuccin"
require "user.cmp"
require "user.lsp"
require "user.fidget"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.hop"
require "user.colorizer"
require "user.neoscroll"
require "user.todo-comments"
require "user.symbol-outline"
require "user.dap"
require "user.dap-python"
require "user.dap-ui"
require "user.glow"
require "user.modes_lines"
require "user.tabnine"
vim.cmd('source ~/.config/nvim/vimscript/markdown-prev.vim')
>>>>>>> Stashed changes
