-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT : A subtle, warm colorscheme for Neovim inspired by Sublime Text's Melange theme.
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================

return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
		opts = {
			extra_groups = {
				"NvimTreeNormal",
				"NvimTreeNormalNC",
				"NvimTreeSignColumn",
				"NvimTreeEndOfBuffer",
				"NvimTreeWinSeparator",
			},
		},
	},

	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,

		config = function()
			vim.opt.termguicolors = true

			vim.cmd("colorscheme melange")

			-- Better visual selection visibility
			vim.api.nvim_set_hl(0, "Visual", {
				bg = "#3a3a3a",
			})
		end,
	},
}
