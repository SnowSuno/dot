return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>fs", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>fS", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
        },
      },
    },
  },
}
