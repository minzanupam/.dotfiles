local augroup_build = vim.api.nvim_create_augroup("build", { clear = true })
local yank_group = vim.api.nvim_create_augroup("fmt", { clear = true })
local augroup_fmt = vim.api.nvim_create_augroup("fmt", { clear = true })
local augroup_lint = vim.api.nvim_create_augroup("lint", { clear = true })

-- vim.api.nvim_create_autocmd("BufNewFile,BufWinEnter", {
-- 	pattern = "*",
-- 	group = augroup_build,
-- 	command = "setlocal formatoptions-=cro",
-- })
vim.cmd([[set formatoptions+=cro]])

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
		"*.hs",
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
		"*.rs",
	},
	group = augroup_fmt,
	command = "set ts=4 sw=4 noet",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = {
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
