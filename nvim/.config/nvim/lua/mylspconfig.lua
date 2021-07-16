local lspconfig = require'lspconfig'

lspconfig.texlab.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.hls.setup{}
lspconfig.gopls.setup{}
lspconfig.svelte.setup{}
lspconfig.cssls.setup{}
lspconfig.clangd.setup{}
--lspconfig.ccls.setup{
--  init_options = { cache = {directory = ""} }
--}
lspconfig.jedi_language_server.setup{}
lspconfig.dartls.setup{}
lspconfig.tsserver.setup{}
-- lspconfig.denols.setup{
  -- filetypes = { "typescript" }
-- }
lspconfig.bashls.setup{}
lspconfig.sumneko_lua.setup{
    cmd = {
        "/usr/bin/lua-language-server",
        "-E",
        "/usr/share/lua-language-server/main.lua"
    },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim', 'use'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}