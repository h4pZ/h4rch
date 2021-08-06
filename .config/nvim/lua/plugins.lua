-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'ray-x/lsp_signature.nvim'

    -- Debugging
    use { 'mfussenegger/nvim-dap' }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use "Pocco81/DAPInstall.nvim"

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'windwp/nvim-autopairs'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim' }

    -- Status Line and Bufferline
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'romgrk/barbar.nvim'

    -- Color
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    -- Comment
    use 'terrortylor/nvim-comment'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'

    -- Navigation
    use 'glepnir/dashboard-nvim'
    use 'phaazon/hop.nvim'

    -- General plugins
    use 'liuchengxu/vim-which-key'
    --use 'folke/which-key.nvim'
    use 'voldikss/vim-floaterm'

    -- Database
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    -- Documentation Generator 
    use {'kkoomen/vim-doge', run = ':call doge#install()'}

    -- Slime.
    use 'jpalardy/vim-slime'

	-- Discord
    use 'andweeb/presence.nvim'

end)

