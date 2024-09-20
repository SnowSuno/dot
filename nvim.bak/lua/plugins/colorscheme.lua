-- return {
--   "JoosepAlviste/palenightfall.nvim",
--   priority = 1000,
--   config = function()
--     local palenight = require("palenightfall")
--
--     palenight.configure_colors({
--       green = "#8de8a8",
--       statusline = "red"
--     })
--
--     palenight.setup()
--
--     vim.cmd.colorscheme "palenightfall"
--   end
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        mason = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
