let mapleader = " "

lua require("impatient")
" lua require'impatient'.enable_profile()

let g:gruvbox_contrast_dark = 'hard'

set termguicolors
set background=dark
colorscheme luna
" xterm or tmux values I don't know
"set t_8f=\[[38;2;%lu;%lu;%lum
"set t_8b=\[[48;2;%lu;%lu;%lum
" to get a transparent background
"hi Normal ctermbg=NONE guibg=none
hi Normal guibg=none
hi LineNr guibg=none
" for ayu color scheme
" hi LineNr guifg=grey
" hi MatchParen guifg=white guibg=black
" for set laststatus=3
" hi WinSeparator guibg=None

lua <<EOF

require 'plugins'
require 'mytelescope'
require 'mynvimcmp'
require 'mylspconfig'
require 'mytreesitter'
require 'mygitsigns'
require 'myluasnip'
require 'mylspsignature'
require 'mylualine'

require 'colorizer'.setup()

require('orgmode').setup({
	org_agenda_files = {'~/orgs/**/*'},
	org_default_notes_file = '~/orgs/init.org',
	mappings = {
		global = {
		},
	}
})
require('orgmode').setup_ts_grammar()

require "pears".setup()
-- require("luasnip.loaders.from_snipmate").load({include={"java"}})
-- require("luasnip.loaders.from_vscode").load()

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

-- require("lint").linters_by_ft = {
--   python = { "pylint" }
-- }

EOF

source ~/.config/nvim/setmaps.vim
" source ~/.config/nvim/plugs.vim
source ~/.config/nvim/mappings.vim
"source ~/.config/nvim/coc_config.vim
"source ~/.config/nvim/snippet_config.vim
"source ~/.config/nvim/vimspector_config.vim
source ~/.config/nvim/global_variables.vim

" set statusline=
" set statusline=%{gitbranch#name()}\ %f\ %=%(%l,%c%V\ %=\ %)

augroup group1
    autocmd!
    " latex auto compile
    autocmd BufWritePost *.tex !pdflatex -halt-on-error %
    " change directory on buffer enter (works with fzf)
    "autocmd BufEnter * silent! lcd %:p:h
    " add/remove comment/indent to the next line
    autocmd BufNewFile,BufWinEnter * setlocal formatoptions-=cro
    " lsp
    "autocmd BufEnter * lua require'completion'.on_attach()
    "autocmd BufReadPost,FileReadPost * lua require "lsp_signature".on_attach()
    " remove post white spaces
    autocmd BufWritePre * :%s/\s\+$//e
    " dart / flutter
    "  autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync()
    autocmd BufEnter *.dart,*.org,*.js,*.tsx,*.ts set ts=2 sw=2 et
    autocmd BufEnter *.c,*.h,*.cpp,*.hpp set ts=8 sw=8 noet
    autocmd BufEnter *.md set ts=4 sw=4 noet
	autocmd BufEnter *.py,*.hs set ts=4 sw=4 et
	autocmd BufEnter *.go set ts=4 sw=4 noet
	" autocmd BufWritePost <buffer> lua require('lint').try_lint()
	autocmd BufWritePost *.py lua require('lint').try_lint()
augroup END

augroup fmt
  autocmd!
  autocmd BufWritePre *.rust,*.go,*.c Neoformat
augroup END
