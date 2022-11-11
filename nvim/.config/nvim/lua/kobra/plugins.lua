local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup Api from vim in neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by many plugins

	-- Other
	use("nvim-lualine/lualine.nvim")
	use("folke/which-key.nvim")
	use("windwp/nvim-spectre")

  -- Formating
	use("numToStr/Comment.nvim")
  use("tpope/vim-sleuth")
  use("tpope/vim-repeat")
  use("tpope/vim-rhubarb")
	use("gpanders/editorconfig.nvim")
	use("MunifTanjim/prettier.nvim")

  -- Navigation
	use({ "jdhao/better-escape.vim", event = "InsertEnter" }) -- uses 'jk' for ESC
  use("ggandor/leap.nvim")
  use("karb94/neoscroll.nvim")

  -- Terminal
	use("akinsho/toggleterm.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- syntax highlighting
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("airblade/vim-gitgutter")
	use("f-person/git-blame.nvim") -- git blame
	use("sindrets/diffview.nvim")
  use("tpope/vim-fugitive")
  use("shumphrey/fugitive-gitlab.vim")

	-- Auto completion
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround") -- easy surroundings
	use("tpope/vim-endwise") -- auto complete endings
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	})
	use("RRethy/vim-illuminate")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use("onsails/lspkind.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("BurntSushi/ripgrep")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Buffers
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

  -- Database
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-ui")
  use("kristijanhusak/vim-dadbod-completion")

	-- Rest
	use("NTBBloodbath/rest.nvim")

	-- Go
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	-- Colors
	use("sainnhe/sonokai")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
