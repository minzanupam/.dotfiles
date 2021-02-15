"autocomplete
set completeopt=menuone,noinsert,noselect
nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>

"set shortmess+=c
let g:completion_enable_auto_popup = 1
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_confirm_key = "\<C-y>"

" languages servers
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach };
"lua require'lspconfig'.rls.setup{ };
lua<<EOC
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.sumneko_lua.setup {}
require'lspconfig'.jedi_language_server.setup{}
EOC
"lua require'lspconfig'.sumneko_lua.setup { is_installed=false };
"lua <<EOF
"local custom_nvim_lspconfig_attach = function(...) end
"require('nlua.lsp.nvim').setup(require('lspconfig'), {
"  on_attach = custom_nvim_lspconfig_attach,
"
"  -- Include globals you want to tell the LSP are real :)
"  globals = {
"    -- Colorbuddy
"    "Color", "c", "Group", "g", "s",
"  }
"})
"EOF
lua <<EOF
require'lspconfig'.tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"}
}
EOF
autocmd BufEnter * lua require'completion'.on_attach()
