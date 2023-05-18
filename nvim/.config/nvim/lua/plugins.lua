return require("packer").startup({
	function()
		-- speed
		use("lewis6991/impatient.nvim", {})
		-- packer
		use("wbthomason/packer.nvim")
		-- deps
		use("nvim-lua/popup.nvim")
		use("nvim-lua/plenary.nvim")
		-- lsp
		use("neovim/nvim-lspconfig")
		use("SmiteshP/nvim-gps")
		use("mfussenegger/nvim-lint")
		use("simrat39/rust-tools.nvim")
		-- dap
		use("mfussenegger/nvim-dap")
		use("theHamsta/nvim-dap-virtual-text")

		use("simrat39/symbols-outline.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		-- use("nvim-treesitter/playground")
		-- use("theHamsta/nvim-treesitter-pairs")
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("nvim-treesitter/nvim-treesitter-context")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("p00f/nvim-ts-rainbow")
		-- git
		use("tpope/vim-fugitive")
		use("junegunn/gv.vim")

		use("lewis6991/gitsigns.nvim")
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		-- harpoon and telescope
		use({
			"ThePrimeagen/harpoon",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use("ThePrimeagen/git-worktree.nvim")
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
		-- comment
		--  use 'winston0410/commented.nvim'
		use("numToStr/Comment.nvim")
		-- close parenthesis / brackets
		use("windwp/nvim-autopairs")
		-- snip
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		-- use("honza/vim-snippets")
		-- use("rafamadriz/friendly-snippets")
		-- formater
		use("sbdchd/neoformat")
		-- signatures
		use("ray-x/lsp_signature.nvim")
		-- table mode
		use("dhruvasagar/vim-table-mode")
		-- undotree
		use("mbbill/undotree")
		-- color schemes
		use("RRethy/nvim-base16")
		use("themercorp/themer.lua")
		-- use("flazz/vim-colorschemes")
		use("ellisonleao/gruvbox.nvim")
		use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })
		use("shaunsingh/nord.nvim")
		use("folke/tokyonight.nvim")
		use("shaunsingh/moonlight.nvim")
		use("lifepillar/vim-solarized8")
		use("rktjmp/lush.nvim")
		use("RishabhRD/gruvy")
		use("mcchrish/zenbones.nvim")
		-- use("jnurmine/Zenburn")
		-- use("tomasr/molokai")
		-- status line
		use("nvim-lualine/lualine.nvim")
		-- #hex colors
		use("norcalli/nvim-colorizer.lua")
		-- org / wiki
		use("vimwiki/vimwiki")
		-- use({ "nvim-neorg/neorg", requires = "nvim-lua/plenary.nvim" })
		use("vuciv/vim-bujo")
		-- use("nvim-orgmode/orgmode")
		-- use({
		-- 	"lukas-reineke/headlines.nvim",
		-- 	config = function()
		-- 		require("headlines").setup({
		-- 			org = {
		-- 				headline_pattern = false,
		-- 			},
		-- 		})
		-- 	end,
		-- })
		-- use({
		-- 	"akinsho/org-bullets.nvim",
		-- 	config = function()
		-- 		require("org-bullets").setup({
		-- 			symbols = { "◉", "○", "✸", "✿" },
		-- 			-- or a function that receives the defaults and returns a list
		-- 			--  symbols = function(default_list)
		-- 			--  table.insert(default_list, "♥")
		-- 			--  return default_list
		-- 			--  end
		-- 		})
		-- 	end,
		-- })
		-- utils
		use("tpope/vim-surround")
		use("junegunn/vim-easy-align")
		use({
			"AckslD/nvim-trevJ.lua",
			config = 'require("trevj").setup()',
		})
		use("kyazdani42/nvim-web-devicons")
		-- use("ActivityWatch/aw-watcher-vim")
		-- use("dylanaraps/fff.vim")
		-- use("wfxr/minimap.vim")
		use("echasnovski/mini.map")
	end,
	config = {
		git = {
			clone_timeout = 360,
		},
	},
})
