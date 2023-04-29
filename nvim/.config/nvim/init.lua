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
require("myformat")

-- require("lint").linters_by_ft = {
-- 	python = { "pylint" },
-- }
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


local dap = require('dap')
dap.configurations.c = {
  {
	type = 'c';
	request = 'launch';
	name = "Launch file";
	program = "${file}";
	pythonPath = function()
	  return '/usr/bin/python'
	end;
  },
}
