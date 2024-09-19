return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup()

    local keymap = vim.keymap

    keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open neogit panel" })
  end,
}
