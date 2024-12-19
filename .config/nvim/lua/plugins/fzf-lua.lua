return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>fs", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>fS", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
