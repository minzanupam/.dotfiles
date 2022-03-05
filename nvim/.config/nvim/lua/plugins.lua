return require("packer").startup({
	function()
		-- speed
		use("lewis6991/impatient.nvim")
		-- deps
		use("nvim-lua/popup.nvim")
		use("nvim-lua/plenary.nvim")
		-- lsp
		use("neovim/nvim-lspconfig")
		use("SmiteshP/nvim-gps")
		use 'mfussenegger/nvim-lint'
		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/playground")
		use("theHamsta/nvim-treesitter-pairs")
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		-- git
		use("tpope/vim-fugitive")
		use("junegunn/gv.vim")
		use("lewis6991/gitsigns.nvim")
		-- harpoon and telescope
		use({
			"ThePrimeagen/harpoon",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use("nvim-telescope/telescope-fzy-native.nvim")
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		-- emmet
		use("mattn/emmet-vim")
		-- cmp
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		-- use("ray-x/cmp-treesitter")
		use("saadparwaiz1/cmp_luasnip")
		-- comment
		--  use 'winston0410/commented.nvim'
		use("numToStr/Comment.nvim")
		-- close parenthesis / brackets
		use("steelsojka/pears.nvim")
		-- snip
		use("L3MON4D3/LuaSnip")
		use("honza/vim-snippets")
		use("rafamadriz/friendly-snippets")
		-- formater
		use("sbdchd/neoformat")
		-- signatures
		use("ray-x/lsp_signature.nvim")
		-- table mode
		use("dhruvasagar/vim-table-mode")
		-- undotree
		use("mbbill/undotree")
		-- color schemes
		use("flazz/vim-colorschemes")
		use("morhetz/gruvbox")
		use("arcticicestudio/nord-vim")
		use("jnurmine/Zenburn")
		use("tomasr/molokai")
		-- status line
		use("nvim-lualine/lualine.nvim")
		-- #hex colors
		use("norcalli/nvim-colorizer.lua")
		-- org / wiki
		use("vimwiki/vimwiki")
		use("vuciv/vim-bujo")
		use("nvim-orgmode/orgmode")
		use({
			"lukas-reineke/headlines.nvim",
			config = function()
				require("headlines").setup({
					org = {
						headline_pattern = false,
					},
				})
			end,
		})
		use({
			"akinsho/org-bullets.nvim",
			config = function()
				require("org-bullets").setup({
					symbols = { "◉", "○", "✸", "✿" },
					-- or a function that receives the defaults and returns a list
					--  symbols = function(default_list)
					--  table.insert(default_list, "♥")
					--  return default_list
					--  end
				})
			end,
		})
		-- utils
		use("tpope/vim-surround")
		use("junegunn/vim-easy-align")
		use("kyazdani42/nvim-web-devicons")
		-- use("ActivityWatch/aw-watcher-vim")
		use("dylanaraps/fff.vim")
	end,
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
