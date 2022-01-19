let mapleader = " "

lua <<EOF

require 'plugins'
require('packer_compiled')
require('impatient')

EOF

source ~/.config/nvim/setmaps.vim
" source ~/.config/nvim/plugs.vim
source ~/.config/nvim/mappings.vim
"source ~/.config/nvim/coc_config.vim
"source ~/.config/nvim/snippet_config.vim
"source ~/.config/nvim/vimspector_config.vim
source ~/.config/nvim/global_variables.vim

let g:gruvbox_contrast_dark = 'hard'

colorscheme nord
set background=dark
" xterm or tmux values I don't know
"set t_8f=\[[38;2;%lu;%lu;%lum
"set t_8b=\[[48;2;%lu;%lu;%lum
" to get a transparent background
"hi Normal ctermbg=NONE guibg=none
hi Normal guibg=none
hi LineNr guibg=none
" for ayu color scheme
hi LineNr guifg=grey
hi MatchParen guifg=white guibg=black

lua <<EOF
require 'mytelescope'
require 'mynvimcmp'
require 'mylspconfig'
require 'mytreesitter'
require 'mygitsigns'
require 'myluasnip'
require 'mylspsignature'
require 'mylualine'

require 'colorizer'.setup()
-- require ("trouble").setup{}
-- require 'lspsaga'.init_lsp_saga{
--     use_saga_diagnostic_sign = false
-- }
-- require 'commented'.setup {
--         comment_padding = " ",
--         keybindings = {n = "<leader>/", v = "<leader>/", nl = "<leader>/"},
--         set_keybindings = true,
--         ex_mode_cmd = "Comment"
-- }

require('orgmode').setup({
	org_agenda_files = {'~/orgs/**/*'},
	org_default_notes_file = '~/orgs/init.org',
	mappings = {
		global = {
		},
	}
})

--  require('nvim-autopairs').setup{}
require "pears".setup()

-- Setup lspconfig.
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

-- require("luasnip/loaders/from_vscode").load()

-- require'sniprun'.setup({
--   display = {
--     "Classic",                    -- "display results in the command-line  area
--     },
-- })

EOF

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
    autocmd BufEnter *.dart,*.org set ts=2 sw=2 et
    autocmd BufEnter *.c,*.h,*.cpp,*.hpp set ts=8 sw=8 noet
    autocmd BufEnter *.md set ts=4 sw=4 noet
	autocmd BufEnter *.py set ts=4 sw=4 et
augroup END

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END
