local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer; close and reopen Neovim...')
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
  max_jobs = 50,
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
  use('wbthomason/packer.nvim') -- manage packer itself
  use('nvim-lua/popup.nvim') -- common dependency
  use('nvim-lua/plenary.nvim') -- common dependency

  -- Formatting
  use('tpope/vim-sleuth')
  use('tpope/vim-repeat')
  use('tpope/vim-rhubarb')
  use({'editorconfig/editorconfig-vim', config = function() require('kobra.config.editorconfig') end})

  -- Navigation
  use({'jdhao/better-escape.vim', event = 'InsertEnter'})
  use({'ggandor/leap.nvim', config = function() require('kobra.config.leap') end})
  use({'karb94/neoscroll.nvim', config = function() require('kobra.config.neoscroll') end})

  -- Terminal
  use({'akinsho/toggleterm.nvim', config = function() require('kobra.config.toggleterm') end})

  -- Syntax
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('kobra.config.treesitter') end})
  use('nvim-treesitter/playground')
  use({'terrortylor/nvim-comment', config = function() require('kobra.config.comment') end})
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- Git
  use('airblade/vim-gitgutter')
  use('f-person/git-blame.nvim')
  use('sindrets/diffview.nvim')
  use({
    'shumphrey/fugitive-gitlab.vim',
    requires = 'tpope/vim-fugitive',
    config = function() require('kobra.config.fugitive') end,
  })

  -- Completion
  use('f3fora/cmp-spell')
  use('David-Kunz/cmp-npm')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp-signature-help')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-calc')
  use({'hrsh7th/nvim-cmp', config = function() require('kobra.config.cmp') end})

  -- Matchings
  use({'windwp/nvim-autopairs', config = function() require('kobra.config.autopairs') end})
  use('windwp/nvim-ts-autotag')
  use({'andymass/vim-matchup', config = function() require('kobra.config.matchup') end})
  use({'lukas-reineke/indent-blankline.nvim', config = function() require('kobra.config.indent') end})

  -- LSP
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  use({'jose-elias-alvarez/null-ls.nvim', after = 'mason.nvim'})
  use({
    'jayp0521/mason-null-ls.nvim',
    after = 'null-ls.nvim',
    config = function() require('kobra.lsp') end,
  })
  use({'ray-x/lsp_signature.nvim', config = function() require('kobra.config.signature') end})
  use('RRethy/vim-illuminate')
  use('onsails/lspkind.nvim')

  -- DAP
  use('mfussenegger/nvim-dap')
  use('nvim-telescope/telescope-dap.nvim')
  use({'leoluz/nvim-dap-go', config = function() require('kobra.dap.go') end})
  use({'suketa/nvim-dap-ruby', config = function() require('kobra.dap.ruby') end})
  use({
    'mxsdev/nvim-dap-vscode-js',
    opt = true,
    run = 'npm i --legacy-peer-deps && npm run compile',
    config = function() require('kobra.dap.js') end,
  })

  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- Telescope
  use({'nvim-telescope/telescope.nvim', config = function() require('kobra.config.telescope') end})
  use('nvim-telescope/telescope-fzy-native.nvim')
  use('nvim-telescope/telescope-media-files.nvim')
  use('BurntSushi/ripgrep')

  -- Tree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('kobra.config.nvim-tree') end,
  })

  -- Buffers
  use({'beauwilliams/focus.nvim', config = function() require('kobra.config.focus') end})
  use({'romgrk/barbar.nvim', config = function() require('kobra.config.barbar') end})

  -- Database
  use('tpope/vim-dadbod')
  use('kristijanhusak/vim-dadbod-ui')
  use('kristijanhusak/vim-dadbod-completion')

  -- Rest
  use({'NTBBloodbath/rest.nvim', config = function() require('kobra.config.rest') end})

  -- Go
  use({
    'ray-x/go.nvim',
    config = function() require('kobra.config.go') end,
  })
  use('ray-x/guihua.lua')

  -- Colors
  use({'sainnhe/sonokai', config = function() require('kobra.config.colorscheme') end})

  -- Other
  use({'nvim-lualine/lualine.nvim', config = function() require('kobra.config.lualine') end})
  use({'folke/which-key.nvim', config = function() require('kobra.config.whichkey') end})
  use({'windwp/nvim-spectre', config = function() require('kobra.config.spectre') end})
  use({'ThePrimeagen/refactoring.nvim', config = function() require('kobra.config.refactoring') end})
  use({'norcalli/nvim-colorizer.lua', config = function() require('kobra.config.colorizer') end})
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    setup = function()
      vim.g.mkdp_filetypes = {'markdown'}
    end,
    ft = {'markdown'},
  })

  -- Start up
  use('lewis6991/impatient.nvim')
  use('dstein64/vim-startuptime')

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

