require("themer").setup({
	colorscheme = "tokyonight",
	transparent = true,
	term_colors = true,

	styles = {
		-- constant = { style = "bold" },
		-- constantBuiltIn = { style = "bold" },
		-- keyword = { style = "italic" },
		-- keywordBuiltIn = { style = "italic" },
	},
	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
	remaps = {
		palette = {
			gruvbox = {
				["dimmed"] = { ["subtle"] = "#fe8019" },
			},
		},
	},
})

-- gruvbox

-- vim.cmd("hi LineNr guifg=#7c6f64")
-- vim.cmd("hi ColorColumn guibg=#3c3836")
-- vim.cmd("colorscheme gruvbox")
--
-- nord
-- vim.cmd("hi ColorColumn guibg=#3b4252")

-- tokyonight
vim.cmd("hi ColorColumn guibg=#32334a")
--
-- vim.cmd("color gruvbox")
-- vim.cmd("hi Normal guibg=none")
-- vim.cmd("hi LineNr guibg=none")

