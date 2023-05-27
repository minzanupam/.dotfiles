--- init ----------------------------------------------------------------------

local wk=require('which-key')

--- utility / misc ------------------------------------------------------------

-- vim.keymap.set("n", '<leader>y', '+y')
-- vim.keymap.set("n", '<leader>p', '+p')
vim.keymap.set("x", "<leader>p", '"_dP')
-- vim.keymap.set("x", "<leader>p", "p")
-- vim.keymap.set("x", "p", "pgvy")
-- vim.keymap.set("x", "p", "\"_dP")
vim.keymap.set("n", "<C-Up>", ":resize +3<cr>")
vim.keymap.set("n", "<C-Down>", ":resize -3<cr>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -3<cr>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<cr>")
vim.keymap.set("n", "<leader>,i", ":nohls<CR>")
-- vim.keymap.set("n", "<leader>ir", function() require('plenary.reload').reload_module('something') end)
vim.keymap.set("n", "<C-e>", ":Ex<CR>")
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

vim.keymap.set("n", "<leader>rj", require("trevj").format_at_cursor)

--- git diff ------------------------------------------------------------------

vim.keymap.set("n", "<leader>gds", ":Gdiffsplit!<CR>")
vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>")

--- telescope -----------------------------------------------------------------

local telescope = require("telescope.builtin");
vim.keymap.set("n", "<leader>gf", telescope.find_files)
vim.keymap.set("n", "<C-n>", function() telescope.git_files({show_untracked = true}) end)
vim.keymap.set("n", "<leader>gt", telescope.live_grep)
vim.keymap.set("n", "<leader>gc", telescope.git_branches)
vim.keymap.set("n", "<leader>gw", require("telescope").extensions.git_worktree.git_worktrees)
vim.keymap.set("n", "<leader>ts", telescope.lsp_document_symbols)
vim.keymap.set("n", "<leader>tw", telescope.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<leader>tx", function()
	telescope.diagnostics({})
end)
vim.keymap.set("n", "<leader>th", telescope.help_tags)
vim.keymap.set("n", "<leader>mm", telescope.man_pages)


--- lsp -----------------------------------------------------------------------

vim.keymap.set("n", "<C-p>", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gdt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>gdi", vim.lsp.buf.implementation)
-- vim.keymap.set("n", "<leader>gdr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gl", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>ht", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vll", function()
	vim.diagnostic.setloclist({ open_loclist = false })
end)
vim.keymap.set("n", "<leader>vsd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>va", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>vi", vim.lsp.buf.document_symbol)


--- harpoon -------------------------------------------------------------------

vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
vim.keymap.set("n", "<leader>hl", require("harpoon.ui").toggle_quick_menu)

vim.keymap.set("n", "<leader>hvh", function()
	require("harpoon.term").gotoTerminal(1)
end)
-- vim.keymap.set("n", "<leader>hvt", function() require("harpoon.term").gotoTerminal(2) end)
-- vim.keymap.set("n", "<leader>hvn", function() require("harpoon.term").gotoTerminal(3) end)
-- vim.keymap.set("n", "<leader>hvs", function() require("harpoon.term").gotoTerminal(4) end)
vim.keymap.set("n", "<leader>hch", function()
	require("harpoon.term").sendCommand(1, "make build && gdb ./main\n")
end)
vim.keymap.set("n", "<C-h>", function()
	require("harpoon.ui").nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	require("harpoon.ui").nav_file(2)
end)
vim.keymap.set("n", "<c-l>", function()
	require("harpoon.ui").nav_file(3)
end)
-- vim.keymap.set("n", "<c-s>", function() require("harpoon.term").gotoTerminal(1) end)


--- gitsigns ------------------------------------------------------------------

local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>shs", gitsigns.stage_hunk)
vim.keymap.set("n", "<leader>shu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<leader>shr", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>shv", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>shn", gitsigns.next_hunk)
vim.keymap.set("n", "<leader>shp", gitsigns.prev_hunk)
vim.keymap.set("n", "<leader>shx", function()
	gitsigns.blame_line(true)
end)


--- dap ------------------------------------

local dap = require("dap")
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<C-s>", function() dap.step_over() end)
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end)
vim.keymap.set("n", "<leader>ds", function() dap.step_into() end)
vim.keymap.set("n", "<leader>df", function() dap.step_out() end)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set({ "n", "v" }, "<leader>dp", function() dap.ui.widgets.hover() end)
vim.keymap.set("n", "<leader>do", function() dap.repl.open() end)
-- vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<leader>lp', function()
-- 	require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
-- end)
-- vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
vim.keymap.set("n", "<leader>dk", function()
	local widgets = dap.ui.widgets
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>de", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

wk.register({
	d = {
		name = "dap",
		b = { "toggle breakpoint" },
		c = { "continue" },
		s = { "step in" },
		n = { "next/step over" },
		f = { "finish / step out" },
		o = { "repl" },
		p = { "dap widget hover" },
		k = { "dap widget frames" },
		e = { "dap widget scope" },
	}
}, { prefix = "<leader>" })


--- utility / misc part 2 -----------------------------------------------------


vim.cmd([[

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap :ut :UndotreeToggle
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>n :Todo <CR>
imap <C-c> <Esc>

nnoremap <leader>,e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>,t :!mkdir -p <C-R>=expand("%:p:h") . "/" <CR>
" nmap <F2> "=strftime('%Y-%m-%d %H:%M:%S %z')<C-M>p

]])

--[[
nnoremap n nzzzv
nnoremap N Nzzzv
]]--

