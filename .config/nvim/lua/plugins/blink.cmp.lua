return {
  "saghen/blink.cmp",
  version = "v0.7.6",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev" },
      ["<C-j>"] = { "select_next" },
    },
  },
}
