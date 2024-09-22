return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = require("cmp").mapping.preset.insert({
      ["<C-k>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = require("cmp").mapping.select_next_item(), -- next suggestion
    }),
  },
}
