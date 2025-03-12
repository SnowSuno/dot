return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>fs", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>fS", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
  -- opts = function(_, opts)
  --   local fzf = require("fzf-lua")
  --   local config = fzf.config
  --   local actions = fzf.actions
  --
  --   return {
  --     files = {
  --       cwd_prompt = false,
  --       actions = {
  --         ["ctrl-i"] = { actions.toggle_ignore },
  --         ["ctrl-h"] = { actions.toggle_hidden },
  --       },
  --     },
  --     grep = {
  --       actions = {
  --         ["ctrl-i"] = { actions.toggle_ignore },
  --         ["ctrl-h"] = { actions.toggle_hidden },
  --       },
  --     },
  --   }
  -- end,
}
