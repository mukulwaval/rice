return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		require("git-worktree").setup()

		require("telescope").load_extension("git_worktree")

		local map = vim.keymap.set

		map("n", "<leader>gw", function()
			require("telescope").extensions.git_worktree.git_worktrees()
		end, { desc = "Git Worktrees" })

		map("n", "<leader>gW", function()
			require("telescope").extensions.git_worktree.create_git_worktree()
		end, { desc = "Create Git Worktree" })
	end,
}
