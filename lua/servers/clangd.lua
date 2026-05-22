-- ================================================================================================
-- TITLE : clangd (C/C++ Language Server) LSP Setup
-- LINKS :
--   > website: https://clangd.llvm.org/
-- ================================================================================================

return function(capabilities)
	vim.lsp.config("clangd", {
		capabilities = capabilities,
	})
end
