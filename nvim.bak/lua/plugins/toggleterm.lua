return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical size=72<CR>",
      { desc = "Create terminal vertical split" }
    )
    keymap.set(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { desc = "Create terminal horizontal split" }
    )
    keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Create popup terminal" })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      -- keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      -- keymap.set("t", ":", [[<C-\><C-n>:]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    toggleterm.setup({})
  end,
}
