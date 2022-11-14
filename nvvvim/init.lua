vim.cmd([[set runtimepath=$VIMRUNTIME]])
vim.cmd([[set packpath=/tmp/nvim/site]])
-- require("keybindings")
-- require("options")

local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'

local function load_plugins()
	require('packer').startup({
		function(use)
			use('wbthomason/packer.nvim')
			use({ "nvim-lua/plenary.nvim" })
			use({ "kyazdani42/nvim-web-devicons" })
			use({ "kyazdani42/nvim-tree.lua", config = "require('nvimtree-config')" })
			use('neovim/nvim-lspconfig')
			use({
				'williamboman/nvim-lsp-installer',
				config = function()
					require('nvim-lsp-installer').setup({})
				end,
			})
			use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate", config = "require('treesitter-config')" })
			use({ "nvim-treesitter/playground" })
			use({ "nvim-treesitter/nvim-treesitter-refactor" })
			use({ "nvim-treesitter/nvim-treesitter-textobjects" })
			use({
				'ray-x/navigator.lua', config = "require('navigator-config')"
				-- '~/github/ray-x/navigator.lua',
				-- config = function()
				-- 	require('navigator').setup({
				-- 		debug = true,
				-- 		lsp_installer = true,
				-- 		keymaps = { { key = 'gR', func = "require('navigator.reference').async_ref()" } },
					-- })
				-- end,
			})
			use('ray-x/guihua.lua')
			use({ "ray-x/lsp_signature.nvim", config = "require('lsp-signature-config')" })

			use({'hrsh7th/nvim-cmp', config = "require('cmp-config')"})
			use({ "hrsh7th/cmp-nvim-lsp" })
			use({ "hrsh7th/cmp-buffer" })
			use({ "hrsh7th/cmp-path" })
			use({ "hrsh7th/cmp-nvim-lua" })
			use({ "hrsh7th/cmp-cmdline" })
			use({ "L3MON4D3/LuaSnip" })
			use({ "saadparwaiz1/cmp_luasnip" })
			use({ "rafamadriz/friendly-snippets" })
			use({ "onsails/lspkind-nvim" })
			use({ "yamatsum/nvim-cursorline" })
			use({ "terrortylor/nvim-comment", config = "require('comment-config')" })
			use({ "JoosepAlviste/nvim-ts-context-commentstring" })
			use({ "ur4ltz/surround.nvim", config = "require('surround-config')" })


			use('ray-x/aurora')
			use({ "windwp/nvim-autopairs", config = "require('autopairs-config')" })
			use({ "lukas-reineke/indent-blankline.nvim", config = "require('blankline-config')" })
			use({ "windwp/nvim-ts-autotag" })
			use({ "p00f/nvim-ts-rainbow" })
			use({ "nvim-telescope/telescope.nvim", config = "require('telescope-config')" })
			use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
			use({ "nvim-telescope/telescope-symbols.nvim" })
			use({ "nvim-telescope/telescope-media-files.nvim" })
			use({ "nvim-telescope/telescope-packer.nvim" })
			use({ "nvim-telescope/telescope-dap.nvim" })
			use({ "nvim-telescope/telescope-frecency.nvim" })
			use({ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" })



		end,
		config = {
			package_root = package_root,
			compile_path = install_path .. '/plugin/packer_compiled.lua',
		},
	})
	-- navigator/LSP setup
end


if vim.fn.isdirectory(install_path) == 0 then
	print('install packer')
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	load_plugins()
	require('packer').sync()
	vim.cmd('colorscheme aurora')
else
	load_plugins()
	vim.cmd('colorscheme aurora')
end
