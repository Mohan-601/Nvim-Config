-- ================================================================================================
-- TITLE : pyright (Python Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/microsoft/pyright
-- ================================================================================================

return function(capabilities)
	vim.lsp.config("pyright", {
		capabilities = capabilities,
	})
end
