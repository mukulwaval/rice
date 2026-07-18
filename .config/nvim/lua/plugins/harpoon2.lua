return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		-- Load the Telescope extension
		require("telescope").load_extension("harpoon")

		local map = vim.keymap.set

		map("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file" })

		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		map("n", "<C-h>", function() harpoon:list():select(1) end)
		map("n", "<C-t>", function() harpoon:list():select(2) end)
		map("n", "<C-n>", function() harpoon:list():select(3) end)
		map("n", "<C-s>", function() harpoon:list():select(4) end)

		-- Telescope Harpoon picker
		map("n", "<leader>hm", "<cmd>Telescope harpoon marks<CR>", {
			desc = "Find Harpoon Marks",
		})
	end,
}
