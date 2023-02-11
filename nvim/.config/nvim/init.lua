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
require("mytheme")

require("colorizer").setup()
require("nvim-autopairs").setup()

require("neogit").setup({})

-- local rt = require("rust-tools")
-- rt.setup({
-- 	server = {
-- 		on_attach = function(_, bufnr)
-- 			-- Hover actions
-- 			-- vim.keymap.set("n", "<leader>hgh", rt.hover_actions.hover_actions, { buffer = bufnr })
-- 			-- Code action groups
-- 			-- vim.keymap.set("n", "<Leader>hga", rt.code_action_group.code_action_group, { buffer = bufnr })
-- 		end,
-- 	},
-- })

require("symbols-outline").setup()

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

--[[
require('orgmode').setup_ts_grammar()
require("luasnip.loaders.from_snipmate").load({include={"java"}})
require("luasnip.loaders.from_vscode").load()
]]
--

-- source ~/.config/nvim/setmaps.vim
-- source ~/.config/nvim/mappings.vim
-- source ~/.config/nvim/global_variables.vim

require("opts")
require("mappings")
require("vars")

-- require("lint").linters_by_ft = {
-- 	python = { "pylint" },
-- }

local augroup_build = vim.api.nvim_create_augroup("build", { clear = true })
local yank_group = vim.api.nvim_create_augroup("fmt", { clear = true })
local augroup_fmt = vim.api.nvim_create_augroup("fmt", { clear = true })
local augroup_lint = vim.api.nvim_create_augroup("lint", { clear = true })

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
		"*.rs",
		"*.svelte",
		"*.tsx",
		"*.ts",
		"*.js",
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
		"*.json",
		"*.yaml",
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
		"*.hs",
		"*.py",
	},
	group = augroup_fmt,
	command = "set ts=4 sw=4 et",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = {
		"*.c",
		"*.cpp",
	},
	group = augroup_fmt,
	command = "set ts=4 sw=4 noet",
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	group = augroup_lint,
-- 	pattern = {
-- 		"*.py",
-- 	},
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = {
		"*",
	},
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- vim.cmd([[syntax off]])

local function reload()
	local package_name = tostring(vim.fn.expand("%:r"))
	package.loaded[package_name] = nil
	require(package_name)
end

function git_accept_both()
	vim.cmd([[:g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d]])
end


vim.keymap.set("n", "<leader>rr", reload)
