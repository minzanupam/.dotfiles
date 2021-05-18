" coc must be enabled to use coc-snippets
" settings for coc snippets
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" let g:coc_snippet_next = '<tab>'
" settings for coc snippets end

" ultisnips config
let g:UltiSnipsExpandTrigger="<c-k>u"
let g:UltiSnipsJumpForwardTrigger="<c-k>f"
let g:UltiSnipsJumpBackwardTrigger="<c-k>b"
" ultisnips config end
