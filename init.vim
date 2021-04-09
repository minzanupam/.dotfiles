" set the tab globaly
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set ignorecase
set smartcase
set colorcolumn=80
"set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20
"set textwidth=80
" line number
set nu
set rnu
let mapleader = " "
" set auto comment off
" autocmd BufNewFile,BufWinEnter * setlocal formatoptions-=cro
" set auto comment on
autocmd BufNewFile,BufWinEnter * setlocal formatoptions=cro
set noswapfile
"set nohlsearch
set hlsearch
set foldmethod=manual
set foldlevel=9
set foldnestmax=5
" indentation guild
"set list lcs=tab:\¦\ 


" maps for cut copy and paste from clipboard
noremap <leader>y "+y
" noremap <leader>d "+d
noremap <leader>p "+p
" maps for ecsape, save and quit
"imap <C-L> <Esc>
" map <C-K> :w<CR>
" map <C-J> :q<CR>

nnoremap <C-Up> <cmd>resize +3<cr>
nnoremap <C-Down> <cmd>resize -3<cr>
nnoremap <C-Left> <cmd>vertical resize -3<cr>
nnoremap <C-Right> <cmd>vertical resize +3<cr>

noremap <leader>i :nohls<CR>

"maps for most recently used buffers
noremap <C-h> :BufMRUNext<CR>
noremap <C-l> :BufMRUPrev<CR>
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
nnoremap :nt :NERDTreeToggle
" fff file manager
let g:fff#split = "20new"
let g:fff#split_direction = "nosplitright splitbelow"
map <leader>f :F<CR>
" nerd commenter
map <leader>/ <plug>NERDCommenterToggle
let g:NERDDefaultAlign='left'
" multiple cursors mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<leader><C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_quit_key            = '<Esc>'

" fzf
nnoremap <C-n> :GFiles<CR>
" fzf ripgrep
nnoremap <C-p> :Rg<CR>
" maximizer
nnoremap <leader>m :MaximizerToggle<CR>

" undotree config
nnoremap :ut :UndotreeToggle

" visual search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"vim-plug
call plug#begin('~/.config/nvim/plugged')
" color schemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'jnurmine/Zenburn'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mildred/vim-bufmru'
Plug 'drewtempelmeyer/palenight.vim'
" language plugins
"Plug 'dart-lang/dart-vim-plugin'
"" IDE features
Plug 'dylanaraps/fff.vim'
"Plug 'ptzz/lf.vim'
"    Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/vim-closer'
Plug 'preservim/nerdcommenter'
"" git
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
"" indentation guide
" Plug 'thaerkh/vim-indentguides'
"" global languge highlights
Plug 'sheerun/vim-polyglot'
"" different colored brackets paranthesis
" Plug 'frazrepo/vim-rainbow'
" " react css styled components
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
"" vim latex - vimtex
Plug 'lervag/vimtex'
"" get some shell commands in vim
"Plug 'tpope/vim-eunuch'
"" theming tmux line with vim
Plug 'edkolev/tmuxline.vim'
"" save vim sessions
Plug 'tpope/vim-obsession'
"" Multiline vim cursors
Plug 'terryma/vim-multiple-cursors'
"" maximize the window
Plug 'szw/vim-maximizer'
"" css colors 
Plug 'ap/vim-css-color'
"" :VimBeGood game remove neovim from npm if you happen to remove this plugin
"Plug 'ThePrimeagen/vim-be-good'
" write with sudo
"Plug 'lambdalisue/suda.vim'

"" vim table mode
Plug 'dhruvasagar/vim-table-mode'
"" vim debugging
Plug 'puremourning/vimspector'

"" Undotree
Plug 'mbbill/undotree'

"vim lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'nvim-lua/diagnostic-nvim'
"Plug 'tjdevries/nlua.nvim'

" coc 
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" vim snippets
" Plug 'mlaursen/vim-react-snippets'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'

" minimap 
" Plug 'wfxr/minimap.vim'

call plug#end()

" vim airline config
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
" let g:airline_theme='lucius'

" turn off and disable matching parenthesis
let g:loaded_matchparen = 1
" dart / flutter plugin settings 
let g:dart_format_on_save = 1
" line indentation guide style
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '¦'
" rainbow brackets options 
" let g:rainbow_active = 1

let g:AutoPairsShortcutToggle = '<C-j>'

" latex auto compile
" autocmd BufWritePost *.tex !pdflatex %
let g:tex_flavor = 'latex'

" vim table mode
"let g:table_mode_corner='+'
"let g:table_mode_corner_corner='+'

" change director on buffer enter (works with fzf)
autocmd BufEnter * silent! lcd %:p:h

colorscheme gruvbox
set background=dark
" set t_8f=\[[38;2;%lu;%lu;%lum
" set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors
" to get a transparent background
"hi Normal ctermbg=NONE guibg=none
"hi LineNr guibg=none
 
hi Normal guibg=none
hi LineNr guibg=none
" for ayu color scheme
"hi LineNr guifg=grey

"source ~/.config/nvim/coc_config.vim
source ~/.config/nvim/lsp_config.vim
"source ~/.config/nvim/snippet_config.vim
source ~/.config/nvim/vimspector_config.vim

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {rust, lua, typescript}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

" dvorak
"noremap h <left>
"noremap t <up>
"noremap n <down>
"noremap s <right>
"
"noremap j t
"noremap l n
"noremap k s
"noremap J T
"noremap L N
"noremap K S
