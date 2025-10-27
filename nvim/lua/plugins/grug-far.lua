-- grug-far.nvim is a Neovim plugin that provides an enhanced
-- “find and replace” interface (like :s but smarter and easier to use).
return {
	"MagicDuck/grug-far.nvim",
	config = function()
		vim.keymap.set("n", "<leader>gf", function()
			require("grug-far").open()
		end, { desc = "Open GrugFar (Find and Replace)" })
	end,
}
