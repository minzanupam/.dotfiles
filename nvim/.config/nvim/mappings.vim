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
" nnoremap <leader>ypwd :let @+ = expand("%:p")<cr>
" maps for ecsape, save and quit
"imap <C-L> <Esc>
" map <C-K> :w<CR>
" map <C-J> :q<CR>
"nnoremap <leader>cd :lcd %:p:h<cr>
"nnoremap <leader>e :e %:p:h/
nnoremap <C-Up> :resize +3<cr>
nnoremap <C-Down> :resize -3<cr>
nnoremap <C-Left> :vertical resize -3<cr>
nnoremap <C-Right> :vertical resize +3<cr>
" multipurpose mapping
nnoremap <leader>,i :nohls<CR>
nnoremap <leader>if :lua vim.lsp.buf.formatting_sync()<CR>
nnoremap <leader>ir :lua require('plenary.reload').reload_module('something')<CR>
"maps for most recently used buffers
"noremap <C-h> :BufMRUNext<CR>
"noremap <C-l> :BufMRUPrev<CR>
"noremap <C-j> <C-w>w
"noremap <C-k> <C-w>W
" maps quick fix list
nnoremap <C-j> :cnext <bar> :normal zz<CR>
nnoremap <C-k> :cprev <bar> :normal zz<CR>
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
nnoremap <leader>tff :lua require('telescope.builtin').find_files()<cr>
nnoremap <C-p> :lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <C-n> :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gt :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>td :lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <leader>tw :lua require('telescope.builtin').lsp_workspace_symbols()<CR>
nnoremap <leader>tx :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
nnoremap <leader>mm :lua require('telescope.builtin').man_pages()<CR>
"nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
"lsp
nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>gr :lua vim.lsp.buf.references()<cr>
" nnoremap <leader>gl :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>gl :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>ht :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<cr>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<cr>
" harpoon
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hl :lua require("harpoon.ui").toggle_quick_menu()<cr>
" nnoremap <leader>hh :lua require("harpoon.ui").nav_file(1)<cr>
" nnoremap <leader>ht :lua require("harpoon.ui").nav_file(2)<cr>
" nnoremap <leader>hn :lua require("harpoon.ui").nav_file(3)<cr>
" nnoremap <leader>hs :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>hvh :lua require("harpoon.term").gotoTerminal(1)<cr>
nnoremap <leader>hvt :lua require("harpoon.term").gotoTerminal(2)<cr>
nnoremap <leader>hvn :lua require("harpoon.term").gotoTerminal(3)<cr>
nnoremap <leader>hvs :lua require("harpoon.term").gotoTerminal(4)<cr>
nnoremap <leader>hch :lua require("harpoon.term").sendCommand(1, "make build && ./target/main\n")<cr>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <c-s> :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <c-l> :lua require("harpoon.ui").nav_file(3)<cr>
" trouble nvim
" nnoremap <leader>xx :TroubleToggle<cr>
" nnoremap <leader>xw :TroubleToggle lsp_workspace_diagnostics<cr>
" nnoremap <leader>xd :TroubleToggle lsp_document_diagnostics<cr>
" nnoremap <leader>xq :TroubleToggle quickfix<cr>
" nnoremap <leader>xl :TroubleToggle loclist<cr>
" nnoremap <leader>gR :TroubleToggle lsp_references<cr>
" git signs
nnoremap <leader>shs :lua require"gitsigns".stage_hunk()<CR>
vnoremap <leader>shs :lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>
nnoremap <leader>shu :lua require"gitsigns".undo_stage_hunk()<CR>
nnoremap <leader>shr :lua require"gitsigns".reset_hunk()<CR>
vnoremap <leader>shr :lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>
nnoremap <leader>shR :lua require"gitsigns".reset_buffer()<CR>
nnoremap <leader>shP :lua require"gitsigns".preview_hunk()<CR>
nnoremap <leader>shn :lua require"gitsigns".next_hunk()<CR>
nnoremap <leader>shp :lua require"gitsigns".prev_hunk()<CR>
nnoremap <leader>shb :lua require"gitsigns".blame_line(true)<CR>
" binay editing
nnoremap <leader>hbo :lua require"mybinary".binary_mode_open()<CR>
nnoremap <leader>hbc :lua require"mybinary".binary_mode_close()<CR>
" lspsaga

" lsp extensions
" nnoremap <Leader>ht :lua require'lsp_extensions'.inlay_hints{ only_current_line = true, enabled = { "TypeHint", "ChainingHint", "ParameterHint" } }<CR>


" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" maximizer
" nnoremap <leader>m :MaximizerToggle<CR>
" undotree config
nnoremap :ut :UndotreeToggle
" visual search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Store relative line number jumps in the jumplist. j, k
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" vmap<leader>f <Plug>SnipRun
" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" notes
" nnoremap <leader>ns :tab drop /tmp/notes.md<CR>
" nnoremap <leader>n :tab drop /home/anupam/Documents/notes/index.md<CR>
nnoremap <leader>n :tab drop /home/anupam/orgs/init.org<CR>
" escape
imap <C-c> <Esc>
" n search center
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z
" undo break point
" inoremap , ,<c-g>u
" inoremap . .<c-g>u
" inoremap ( (<c-g>u
" inoremap ) )<c-g>u
" inoremap [ [<c-g>u
" inoremap ; ;<c-g>u
" edit/open file in the same dir as current file
nnoremap <leader>,e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>,t :!mkdir -p <C-R>=expand("%:p:h") . "/" <CR>
