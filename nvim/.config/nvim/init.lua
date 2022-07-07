vim.g.mapleader = " "

-- require "impatient'.enable_profile()

vim.g.gruvbox_contrast_dark = "hard"

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[
colorscheme gruvbox
hi Normal guibg=none
hi LineNr guibg=none
]])

-- set laststatus=3
-- hi WinSeparator guibg=none

require "plugins"
require "mytelescope"
require "mynvimcmp"
require "mylspconfig"
require "mytreesitter"
require "mygitsigns"
require "myluasnip"
require "mylspsignature"
require "mylualine"

require "colorizer".setup()
require "pears".setup()
require "rust-tools".setup({})

require("Comment").setup({
    ---@param ctx Ctx
    pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')
            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'
            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end
            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
});

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
]]--

-- source ~/.config/nvim/setmaps.vim
-- source ~/.config/nvim/mappings.vim
-- source ~/.config/nvim/global_variables.vim

require "opts"
require "mappings"
require "vars"

local augroup_build = vim.api.nvim_create_augroup('build', {clear = true})

local augroup_cleanup = vim.api.nvim_create_augroup('cleanup', {clear = true})


vim.api.nvim_create_autocmd('BufNewFile,BufWinEnter', {
  pattern = '*',
  group = augroup_build,
  command = 'setlocal formatoptions-=cro'
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = augroup_build,
  command = [[:%s/\s\+$//e]]
})

