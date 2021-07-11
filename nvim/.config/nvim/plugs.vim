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
"Plug 'mildred/vim-bufmru'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'dylanaraps/fff.vim'
"Plug 'ptzz/lf.vim'
"    Plug 'rbgrouleff/bclose.vim'
"Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"  Plug 'junegunn/fzf.vim'
"  Plug 'stsewd/fzf-checkout.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'akinsho/flutter-tools.nvim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'rstacruz/vim-closer'
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
"Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-gitbranch'
"Plug 'mattn/emmet-vim'
"" vim latex - vimtex
"Plug 'lervag/vimtex'
"" get some shell commands in vim
"Plug 'tpope/vim-eunuch'
"" theming tmux line with vim
"Plug 'edkolev/tmuxline.vim'
"" save vim sessions
"Plug 'tpope/vim-obsession'
"" Multiline vim cursors
"Plug 'terryma/vim-multiple-cursors'
"" maximize the window
"Plug 'szw/vim-maximizer'
"" css colors 
"Plug 'ap/vim-css-color'
Plug 'norcalli/nvim-colorizer.lua'
"" :VimBeGood game remove neovim from npm if you happen to remove this plugin
"Plug 'ThePrimeagen/vim-be-good'
" write with sudo
"Plug 'lambdalisue/suda.vim'
"" vim table mode
Plug 'dhruvasagar/vim-table-mode'
"" vim debugging
"Plug 'puremourning/vimspector'
"" Undotree
Plug 'mbbill/undotree'
"vim lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
" coc 
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'
" vim snippets
"Plug 'mlaursen/vim-react-snippets'
"Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
" minimap 
" Plug 'wfxr/minimap.vim'
"Plug 'chaoren/vim-wordmotion'
"Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
"Plug 'rhysd/open-pdf.vim'
"Plug 'tpope/vim-surround'
"Plug 'ActivityWatch/aw-watcher-vim'
call plug#end()
