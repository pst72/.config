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

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-tree/nvim-tree.lua" })
	-- use({ "antoinemadec/FixCursorHold.nvim" })
	-- use({ "akinsho/bufferline.nvim" })
	-- use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "folke/twilight.nvim" })
	use({ "ellisonleao/glow.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ "kylechui/nvim-surround" })
	use({ "rcarriga/nvim-notify" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "sudormrfbin/cheatsheet.nvim" }) -- cheatsheets

	-- LSP -- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "junnplus/lsp-setup.nvim" })
	-- } -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use({ "yamatsum/nvim-cursorline" })
	use({ "RRethy/vim-illuminate" })
	use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
	use({
		"ray-x/navigator.lua",
		-- config = function()
		-- 	require("navigator").setup({
		-- 		-- debug = true,
		-- 		mason = true,
		-- 		-- keymaps = {
		-- 		--   { key = 'gr',
		-- 		--     func = "require(navigator.reference).async_ref()"
		-- 		--   }
		-- 		-- },
		-- 	})
		-- end,
	})
	use({ "ray-x/lsp_signature.nvim" })
	use({ "lewis6991/hover.nvim" })
	use({ "kkharji/lspsaga.nvim" })
	use({ "kkharji/sqlite.lua" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-telescope/telescope-packer.nvim" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "nvim-telescope/telescope-frecency.nvim" })
	use({ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-refactor" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "mfussenegger/nvim-dap-python" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })
	use({ "is0n/jaq-nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
