-- top level so that it can be overrided by plugins
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.expandtab = false
-- set the tab globaly
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
-- vim.o.colorcolumn=79
vim.cmd("set colorcolumn=79")
vim.o.undofile = true
vim.o.swapfile = true
vim.o.hlsearch = false
vim.o.splitbelow = false
vim.o.nu = true
vim.o.rnu = true
-- set autowriteall
vim.o.autowrite = true
vim.o.hidden = false
vim.o.guicursor="n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
-- set textwidth=80
-- set foldmethod=manual
-- set foldlevel=9
-- set foldnestmax=5
-- indentation guild
-- set list lcs=tab:\¦\
-- lsp autocompletion
vim.o.completeopt="menu,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.updatetime=50
vim.o.clipboard="unnamedplus"
-- set syntax=off
vim.o.syntax="off"
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.incsearch = true
-- vim.o.nrformats = vim.o.nrformats .. "alpha"
vim.cmd([[ set formatoptions=cron ]])
-- set cursorcolumn
-- set cursorline
vim.o.laststatus=3

-- filetype indent off
-- filetype plugin on
-- filetype off

vim.o.guifont="Ubuntu Mono:h18"
-- set guifont=Comic\ Mono:h15
