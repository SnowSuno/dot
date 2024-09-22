return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local theme = require("lualine.themes.modus-vivendi")

    lualine.setup({
      options = { theme = theme, section_separators = "", component_separators = "" },
    })
  end,
}
