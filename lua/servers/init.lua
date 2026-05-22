local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.clangd")(capabilities)

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"clangd",
})
