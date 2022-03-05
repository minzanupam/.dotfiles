local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({})

lspconfig.texlab.setup({ autostart = false })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.hls.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.svelte.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.sumneko_lua.setup({ capabilities = capabilities })
-- lspconfig.ccls.setup{
--     autostart = false,
--     init_options = { cache = {directory = ""} }
-- }
-- lspconfig.jedi_language_server.setup({
-- 	capabilities = capabilities,
-- 	cmd = {
-- 		"/usr/bin/jedi-language-server",
-- 	},
-- 	single_file_support = true,
-- 	root_dir = require("lspconfig.util").root_pattern(".git", "*.py"),
-- })
lspconfig.dartls.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({
	root_dir = lspconfig.util.root_pattern("package.json"),
	capabilities = capabilities,
})
lspconfig.denols.setup({
	root_dir = lspconfig.util.root_pattern("deno.json"),
	capabilities = capabilities,
})
lspconfig.bashls.setup({ capabilities = capabilities })
lspconfig.java_language_server.setup{cmd = {"/usr/bin/java-language-server"},  capabilities = capabilities}

lspconfig.jedi_language_server.setup{capabilities = capabilities}
-- lspconfig.pylsp.setup({capabilities = capabilities})
