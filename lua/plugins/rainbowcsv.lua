return {
	"mechatroner/rainbow_csv",
	config = function()
		vim.g.rainbow_csv = {
			enable = 1,
			-- colors = {
			--   '#ff0000',
			--   '#00ff00',
			--   '#0000ff',
			--   '#ffff00',
			--   '#00ffff',
			--   '#ff00ff',
			--   '#ffffff',
			--   '#000000',
			-- },
			csvs = {
				".*\\.csv$",
				".*\\.tsv$",
			},
		}
	end,
}
