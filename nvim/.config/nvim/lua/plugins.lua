return require('packer').startup(function()
	-- deps
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'SmiteshP/nvim-gps'
	-- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
	use 'nvim-treesitter/playground'
	use 'theHamsta/nvim-treesitter-pairs'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	-- git
	use 'tpope/vim-fugitive'
	use 'junegunn/gv.vim'
	use 'lewis6991/gitsigns.nvim'
	-- harpoon and telescope
	use {
		'ThePrimeagen/harpoon',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-telescope/telescope-fzy-native.nvim'
	-- emmet
	use 'mattn/emmet-vim'
	-- cmp
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'ray-x/cmp-treesitter'
	use 'saadparwaiz1/cmp_luasnip'
	-- comment
	use 'winston0410/commented.nvim'
	-- close parenthesis / brackets
	use 'steelsojka/pears.nvim'
	-- snip
	use 'L3MON4D3/LuaSnip'
	-- signatures
	use 'ray-x/lsp_signature.nvim'
	-- table mode
	use 'dhruvasagar/vim-table-mode'
	-- undotree
	use 'mbbill/undotree'
	-- color schemes
	use 'flazz/vim-colorschemes'
	use 'morhetz/gruvbox'
	use 'arcticicestudio/nord-vim'
	use 'jnurmine/Zenburn'
	use 'tomasr/molokai'
	-- status line
	use 'nvim-lualine/lualine.nvim'
	-- #hex colors
	use 'norcalli/nvim-colorizer.lua'
	-- utils
	use 'tpope/vim-surround'
	use 'junegunn/vim-easy-align'
	use 'kyazdani42/nvim-web-devicons'
	use 'vimwiki/vimwiki'
	use 'ActivityWatch/aw-watcher-vim'
end)