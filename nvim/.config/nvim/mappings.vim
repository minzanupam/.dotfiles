"map w <Plug>WordMotion_w
"map b <Plug>WordMotion_b
" fff
"nnoremap <leader>f :F<CR>
" nerd commenter
"map <leader>/ <plug>NERDCommenterToggle
" maps for cut copy and paste from clipboard
" noremap <leader>y "+y
" noremap <leader>d "+d
" noremap <leader>p "+p
nnoremap <leader>ypwd <cmd>let @+ = expand("%:p")<cr>
" maps for ecsape, save and quit
"imap <C-L> <Esc>
" map <C-K> :w<CR>
" map <C-J> :q<CR>
"nnoremap <leader>cd <cmd>lcd %:p:h<cr>
"nnoremap <leader>e :e %:p:h/
nnoremap <C-Up> <cmd>resize +3<cr>
nnoremap <C-Down> <cmd>resize -3<cr>
nnoremap <C-Left> <cmd>vertical resize -3<cr>
nnoremap <C-Right> <cmd>vertical resize +3<cr>
" multipurpose mapping
" noremap <leader>i :nohls<CR>
noremap <leader>i :lua vim.lsp.buf.formatting_sync()<CR>
"maps for most recently used buffers
"noremap <C-h> :BufMRUNext<CR>
"noremap <C-l> :BufMRUPrev<CR>
"noremap <C-j> <C-w>w
"noremap <C-k> <C-w>W
" maps quick fix list
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>
" vim fugitive mapings
noremap <leader>gh :diffget //2<CR>
noremap <leader>gl :diffget //3<CR>
" nerdtree
"nnoremap :nt :NERDTreeToggle
" fzf
"nnoremap <C-n> :GFiles<CR>
" fzf ripgrep
"nnoremap <C-p> :Rg<CR>
" telescope
nnoremap <leader>tff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <C-p> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-n> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <C-p> <cmd>lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <leader>td <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <leader>tx <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
"nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<CR>
"lsp
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<cr>
" nnoremap <leader>gl <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>gl <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vll <cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<cr>
nnoremap <leader>vsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
" harpoon
nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hl <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>hh <cmd>lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>ht <cmd>lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>hn <cmd>lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>hs <cmd>lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>hvh <cmd>lua require("harpoon.term").gotoTerminal(1)<cr>
nnoremap <leader>hvt <cmd>lua require("harpoon.term").gotoTerminal(2)<cr>
nnoremap <leader>hvn <cmd>lua require("harpoon.term").gotoTerminal(3)<cr>
nnoremap <leader>hvs <cmd>lua require("harpoon.term").gotoTerminal(4)<cr>
nnoremap <leader>hch <cmd>lua require("harpoon.term").sendCommand(1, "make build && ./target/main\n")<cr>
nnoremap <C-h> <cmd>lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-t> <cmd>lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <c-s> <cmd>lua require("harpoon.term").gotoTerminal(1)<cr>
nnoremap <c-l> <cmd>lua require("harpoon.term").gotoTerminal(2)<cr>
" trouble nvim
" nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap <leader>gR <cmd>TroubleToggle lsp_references<cr>
" git signs
nnoremap <leader>shs <cmd>lua require"gitsigns".stage_hunk()<CR>
vnoremap <leader>shs <cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>
nnoremap <leader>shu <cmd>lua require"gitsigns".undo_stage_hunk()<CR>
nnoremap <leader>shr <cmd>lua require"gitsigns".reset_hunk()<CR>
vnoremap <leader>shr <cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>
nnoremap <leader>shR <cmd>lua require"gitsigns".reset_buffer()<CR>
nnoremap <leader>shP <cmd>lua require"gitsigns".preview_hunk()<CR>
nnoremap <leader>shn <cmd>lua require"gitsigns".next_hunk()<CR>
nnoremap <leader>shp <cmd>lua require"gitsigns".prev_hunk()<CR>
nnoremap <leader>shb <cmd>lua require"gitsigns".blame_line(true)<CR>
" lspsaga


" luasnip
imap <silent><expr> <C-e> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <C-e> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" maximizer
nnoremap <leader>m <cmd>MaximizerToggle<CR>
" undotree config
nnoremap :ut :UndotreeToggle
" visual search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Store relative line number jumps in the jumplist. j, k
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vmap<leader>f <Plug>SnipRun
" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" notes
nnoremap <leader>n <cmd>tab drop /tmp/notes.md<cr>
" escape
imap <C-c> <Esc>
" n search center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" undo break point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ; ;<c-g>u
