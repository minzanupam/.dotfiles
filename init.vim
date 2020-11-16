" set the tab globaly
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set colorcolumn=80
"set textwidth=80

" line number
set nu
set rnu

let mapleader = " "

" set auto comment off
autocmd BufNewFile,BufWinEnter * setlocal formatoptions-=cro

" set swap off 
set noswapfile

" turn off search highligting
set nohlsearch

" indentation guild
"set list lcs=tab:\¦\ 


" color scheme
colorscheme gruvbox

" set folding
set foldmethod=syntax
set foldlevel=9
set foldnestmax=5


" key maps 
" maps for cut copy and paste from clipboard
noremap <leader>y "+y
noremap <leader>d "+d
noremap <leader>p "+p
" maps for ecsape, save and quit
"imap <C-L> <Esc>
"map <C-K> :w<CR>
" map <C-J> :q<CR>

" vim fugitive mapings
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" nerdtree
map :nt :NERDTreeToggle
" nerd commenter
map <leader>/ <plug>NERDCommenterToggle
let g:NERDDefaultAlign='left'

" multiple cursors mappings
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<leader><C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" fzf
nnoremap <C-p> :GFiles<CR>
" fzf ripgrep
nnoremap <C-n> :Rg<CR>


" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

" maximizer
nnoremap <leader>m :MaximizerToggle!<CR>
" debug bindings
" nnoremap <leader><leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader><leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader><leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader><leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader><leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader><leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader><leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader><leader>de :call vimspector#Reset()<CR>
" nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
" nmap <leader>dl <Plug>VimspectorStepInto
" nmap <leader>dj <Plug>VimspectorStepOver
" nmap <leader>dk <Plug>VimspectorStepOut
" nmap <leader>d_ <Plug>VimspectorRestart
" nnoremap <leader>d<space> :call vimspector#Continue()<CR>
" nmap <leader>drc <Plug>VimspectorRunToCursor
" nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
" nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" key maps end


 "vim-plug
call plug#begin('~/.config/nvim/plugged')
"" language plugins
"Plug 'dart-lang/dart-vim-plugin'
"" IDE features
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
"" git
Plug 'tpope/vim-fugitive' 
"" indentation guide
Plug 'thaerkh/vim-indentguides'
"" global languge highlights
Plug 'sheerun/vim-polyglot'
"" different colored brackets paranthesis
Plug 'frazrepo/vim-rainbow'
"" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" html
Plug 'mattn/emmet-vim'
"" vim latex - vimtex
Plug 'lervag/vimtex'
"" icons for nerdtree
Plug 'ryanoasis/vim-devicons'
"" get some shell commands in vim
Plug 'tpope/vim-eunuch'
"" tmuxline
Plug 'edkolev/tmuxline.vim'
"" vim react typescript snippets
Plug 'mlaursen/vim-react-snippets'
"" vim snippets list
" Plug 'honza/vim-snippets'
" ultisnips snippet engine
Plug 'SirVer/ultisnips'
"" save vim sessions
Plug 'tpope/vim-obsession'
"" Multiline vim cursors
Plug 'terryma/vim-multiple-cursors'
"" vim debugging
" Plug 'puremourning/vimspector'
"" maximize the window
Plug 'szw/vim-maximizer'
"" css colors 
Plug 'ap/vim-css-color'
"" :VimBeGood game remove neovim from npm if you happen to remove this plugin
"Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

"" write with sudo
"Plug 'lambdalisue/suda.vim'
call plug#end()


" settings for coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" use <tab> for auto complete end here
" setting for coc ends here
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
let g:UltiSnipsExpandTrigger="<c-l>,"
let g:UltiSnipsJumpForwardTrigger="<c-l>,"
let g:UltiSnipsJumpBackwardTrigger="<c-l>."
" ultisnips config end

" vim airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
" vim airline config ends

" turn off and disable matching parenthesis
let g:loaded_matchparen = 1

" dart / flutter plugin settings 
let g:dart_format_on_save = 1

" line indentation guide style
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '¦'

" rainbow brackets options 
" let g:rainbow_active = 1


" set the tab for some specific filetypes
autocmd FileType rust setlocal ts=4 sw=4 
autocmd FileType python,json setlocal ts=4 sw=4 et
autocmd FileType typescriptreact setlocal ts=2 sw=2 
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType dart setlocal ts=2 sw=2 et
autocmd FileType html setlocal ts=2 sw=2
autocmd FileType typescript setlocal ts=2 sw=2 et

" let g:AutoPairsShortcutToggle = '<C-j>'

" latex auto compile
autocmd BufWritePost *.tex !pdflatex %

let g:tex_flavor = 'latex'
