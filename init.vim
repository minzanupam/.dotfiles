let mapleader = " "

source ~/.config/nvim/setmaps.vim
source ~/.config/nvim/plugs.vim
source ~/.config/nvim/maping.vim
"source ~/.config/nvim/coc_config.vim
"source ~/.config/nvim/snippet_config.vim
"source ~/.config/nvim/vimspector_config.vim
source ~/.config/nvim/global_variables.vim

lua <<EOF
require 'telescope'
require 'lspconfig'
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  incremental_selection = { enable = true },
  indent = { enable = true, disable = {"python"} },
}
EOF

" latex auto compile
" autocmd BufWritePost *.tex !pdflatex %
" change directory on buffer enter (works with fzf)
"autocmd BufEnter * silent! lcd %:p:h
" add/remove comment/indent to the next line
autocmd BufNewFile,BufWinEnter * setlocal formatoptions=-cro
" dart
"autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync()
" lsp
autocmd BufEnter * lua require'completion'.on_attach()

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

set statusline=
set statusline=%{gitbranch#name()}\ %f\ %=%(%l,%c%V\ %=\ %)
