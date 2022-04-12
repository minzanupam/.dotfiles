local cmp = require("cmp")

-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		--  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
		--  ['<C-f>'] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Insert,
		}),
	},
	sources = {
		{ name = "luasnip" },
		-- { name = "nvim_lua" },
		-- { name = "treesitter" },
		-- { name = "nvim_lsp" },
		-- { name = "path" },
		-- { name = "buffer" },
		-- { name = 'vsnip' },
		-- { name = 'ultisnips' },
	},
	preselect = false,
})
