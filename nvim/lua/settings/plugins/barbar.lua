return {
	"romgrk/barbar.nvim",
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			insert_at_end = true,
			icons = {
				-- preset = "",
				-- alternate = { filetype = { enabled = true } },
			},
		})
	end,
}
