let mapleader = " "

source ~/.config/nvim/setmaps.vim
source ~/.config/nvim/plugs.vim
source ~/.config/nvim/mappings.vim
"source ~/.config/nvim/coc_config.vim
"source ~/.config/nvim/snippet_config.vim
"source ~/.config/nvim/vimspector_config.vim
source ~/.config/nvim/global_variables.vim

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
"hi LineNr guifg=grey

lua <<EOF
require'colorizer'.setup()
require("trouble").setup{}
require'commented'.setup {
        comment_padding = " ", 
        keybindings = {n = "<leader>/", v = "<leader>/", nl = "<leader>/"},
        set_keybindings = true,
        ex_mode_cmd = "Comment"
}
require 'mylspconfig'
require 'mytelescope'
require 'mytreesitter'
require 'mygitsigns'
-- require 'mylspsignature'

-- require'sniprun'.setup({
--   display = {
--     "Classic",                    -- "display results in the command-line  area
--     },
-- })
EOF

" latex auto compile
" autocmd BufWritePost *.tex !pdflatex %
" change directory on buffer enter (works with fzf)
"autocmd BufEnter * silent! lcd %:p:h
" add/remove comment/indent to the next line
"autocmd BufNewFile,BufWinEnter * setlocal formatoptions=cro
" dart
"autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync()
" lsp
"autocmd BufEnter * lua require'completion'.on_attach()
"autocmd BufReadPost,FileReadPost * lua require "lsp_signature".on_attach()

set statusline=
set statusline=%{gitbranch#name()}\ %f\ %=%(%l,%c%V\ %=\ %)
