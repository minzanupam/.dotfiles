vim.g.mapleader = " "

require("impatient").enable_profile()

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_italic = 0
vim.g.gruvbox_italicize_comments = 0
vim.g.gruvbox_italicize_strings = 0

vim.o.termguicolors = true
vim.o.background = "dark"

-- set laststatus=3
-- hi WinSeparator guibg=none

require("plugins")
require("mytelescope")
require("mynvimcmp")
require("mylspconfig")
require("mytreesitter")
require("mygitsigns")
require("myluasnip")
require("mylspsignature")
require("mylualine")

require("colorizer").setup()
require("nvim-autopairs").setup()

local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			-- vim.keymap.set("n", "<leader>hgh", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			-- vim.keymap.set("n", "<Leader>hga", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

require("symbols-outline").setup()

require("themer").setup({
	colorscheme = "gruvbox",
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

vim.cmd("hi LineNr guifg=#7c6f64")
vim.cmd("hi ColorColumn guibg=#3c3836")
-- vim.cmd("colorscheme gruvbox")
--
-- nord
-- vim.cmd("hi ColorColumn guibg=#3b4252")
--
-- vim.cmd("color gruvbox")
-- vim.cmd("hi Normal guibg=none")
-- vim.cmd("hi LineNr guibg=none")

require("Comment").setup({
	--@param ctx Ctx
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if vim.bo.filetype == "typescriptreact" then
			local U = require("Comment.utils")
			-- Detemine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end
			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
})

require("neorg").setup({})

--[[
require('orgmode').setup({
	org_agenda_files = {'~/orgs/**/*'},
	org_default_notes_file = '~/orgs/init.org',
	mappings = {
		global = {
		},
	}
})
require('orgmode').setup_ts_grammar()
require("luasnip.loaders.from_snipmate").load({include={"java"}})
require("luasnip.loaders.from_vscode").load()
require("lint").linters_by_ft = {
python = { "pylint" }
}
]]
--

-- source ~/.config/nvim/setmaps.vim
-- source ~/.config/nvim/mappings.vim
-- source ~/.config/nvim/global_variables.vim

require("opts")
require("mappings")
require("vars")

local augroup_build = vim.api.nvim_create_augroup("build", { clear = true })

local augroup_fmt = vim.api.nvim_create_augroup("fmt", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile,BufWinEnter", {
	pattern = "*",
	group = augroup_build,
	command = "setlocal formatoptions-=cro",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = augroup_fmt,
	command = [[:%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.go",
	},
	group = augroup_fmt,
	command = ":Neoformat",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = {
		"*.svelte",
		"*.html",
		"*.tsx",
		"*.jsx",
		"*.js",
		"*.ts",
	},
	group = augroup_fmt,
	command = "set ts=2 sw=2 et",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = {
		"*.go",
		"*.rust",
	},
	group = augroup_fmt,
	command = "set ts=4 sw=4 noet",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = {
		"*.c",
		"*.cpp",
	},
	group = augroup_fmt,
	command = "set ts=8 sw=8 noet",
})

-- vim.cmd([[syntax off]])
