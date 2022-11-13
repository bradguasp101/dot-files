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
  use('gpanders/editorconfig.nvim')
  use({'MunifTanjim/prettier.nvim', config = function() require('kobra.config.prettier') end})

  -- Navigation
  use({'jdhao/better-escape.vim', event = 'InsertEnter'})
  use({'ggandor/leap.nvim', config = function() require('kobra.config.leap') end})
  use({'karb94/neoscroll.nvim', config = function() require('kobra.config.neoscroll') end})
  use('mg979/vim-visual-multi')

  -- Terminal
  use({'akinsho/toggleterm.nvim', config = function() require('kobra.config.toggleterm') end})

  -- Syntax
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('kobra.config.treesitter') end})
  use('nvim-treesitter/playground')
  use({'numToStr/Comment.nvim', config = function() require('kobra.config.comment') end})
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
  use({'windwp/nvim-autopairs', config = function() require('kobra.config.autopairs') end})
  use('tpope/vim-surround')
  use('tpope/vim-endwise')
  use({
    'saadparwaiz1/cmp_luasnip',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
    },
    config = function() require('kobra.config.cmp') end,
  })

  -- LSP
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  })
  use('RRethy/vim-illuminate')
  use({
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function() require('kobra.config.lsp_lines') end,
  })
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
  use({'akinsho/bufferline.nvim', config = function() require('kobra.config.bufferline') end})
  use('moll/vim-bbye')

  -- Database
  use('tpope/vim-dadbod')
  use('kristijanhusak/vim-dadbod-ui')
  use('kristijanhusak/vim-dadbod-completion')

  -- Rest
  use({'NTBBloodbath/rest.nvim', config = function() require('kobra.config.rest') end})

  -- Go
  use({
    'ray-x/go.nvim',
    requires = 'ray-x/guihua.lua',
    config = function() require('kobra.config.go') end,
  })

  -- Colors
  use({'sainnhe/sonokai', config = function() require('kobra.config.colorscheme') end})

  -- Other
  use({'nvim-lualine/lualine.nvim', config = function() require('kobra.config.lualine') end})
  use({'folke/which-key.nvim', config = function() require('kobra.config.whichkey') end})
  use({'windwp/nvim-spectre', config = function() require('kobra.config.spectre') end})
  use({'ThePrimeagen/refactoring.nvim', config = function() require('kobra.config.refactoring') end})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

