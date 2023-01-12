-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

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

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim" })
	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
	use({ "ray-x/navigator.lua" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "jackMort/ChatGPT.nvim" })

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	})
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
	-- use({ "nvim-treesitter/nvim-treesitter-refactor", after = 'nvim-treesitter', })

	use({ "lewis6991/hover.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "folke/twilight.nvim" })
	use({ "folke/noice.nvim" })
	use({ "ellisonleao/glow.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ "rcarriga/nvim-notify" })
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "sudormrfbin/cheatsheet.nvim" }) -- cheatsheets
	use({ "kylechui/nvim-surround" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use("norcalli/nvim-colorizer.lua")
	use("nvim-tree/nvim-tree.lua")
	-- Git related plugins
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("lewis6991/gitsigns.nvim")

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "mfussenegger/nvim-dap-python" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })
	use({ "is0n/jaq-nvim" })

	use("folke/tokyonight.nvim")
	-- use 'ray-x/starry.nvim'
	use("EdenEast/nightfox.nvim")
	use("navarasu/onedark.nvim") -- Theme inspired by Atom
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-telescope/telescope-packer.nvim" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	-- use({ "nvim-telescope/telescope-frecency.nvim" })
	use({ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" })
	use({ "ahmedkhalf/project.nvim" })
	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
