local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({})

lspconfig.texlab.setup({ autostart = false })
lspconfig.rust_analyzer.setup({})
lspconfig.hls.setup({})
lspconfig.gopls.setup({})
lspconfig.svelte.setup({})
lspconfig.cssls.setup({})
lspconfig.clangd.setup({})
-- lspconfig.sumneko_lua.setup({})
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
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
lspconfig.dartls.setup({})
lspconfig.tsserver.setup({
	root_dir = lspconfig.util.root_pattern("package.json"),
})
-- lspconfig.denols.setup({
-- 	root_dir = lspconfig.util.root_pattern("deno.json"),
-- })

-- lspconfig.bashls.setup({})
lspconfig.java_language_server.setup({ cmd = { "/usr/bin/java-language-server" } })

lspconfig.pylsp.setup({})
-- lspconfig.jedi_language_server.setup({})
-- lspconfig.pylsp.setup({})
