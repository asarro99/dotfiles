return {
	"kdheepak/lazygit.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies =  {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim"
	},
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
	end,
}
