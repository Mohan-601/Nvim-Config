return function(capabilities)
	vim.lsp.config("lua_ls", {
		capabilities = capabilities,
	})
end
