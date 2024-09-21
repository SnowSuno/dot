return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>fE", false },
    {
      "<leader>ee",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Toogle NeoTree",
    },
    {
      "<leader>ef",
      function()
        require("neo-tree.command").execute({ reveal = true, dir = vim.uv.cwd() })
      end,
      desc = "Reveal current file in NeoTree",
    },
  },
  opts = {
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
    use_popups_for_input = false, -- force use vim.input
  },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        require("window-picker").setup({
          show_prompt = false,
          picker_config = {
            statusline_winbar_picker = {
              -- You can change the display string in status bar.
              -- It supports '%' printf style. Such as `return char .. ': %f'` to display
              -- buffer file path. See :h 'stl' for details.
              selection_display = function(char, windowid)
                return "%=" .. char .. "%="
              end,

              -- whether you want to use winbar instead of the statusline
              -- "always" means to always use winbar,
              -- "never" means to never use winbar
              -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
              use_winbar = "always", -- "always" | "never" | "smart"
            },

            floating_big_letter = {
              -- window picker plugin provides bunch of big letter fonts
              -- fonts will be lazy loaded as they are being requested
              -- additionally, user can pass in a table of fonts in to font
              -- property to use instead

              font = "ansi-shadow", -- ansi-shadow |
            },
          },
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify", "noice" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
          highlights = {
            winbar = {
              focused = {
                fg = "#ededed",
                bg = "#6f96ff",
                bold = true,
              },
              unfocused = {
                fg = "#ededed",
                bg = "#6f96ff",
                bold = true,
              },
            },
          },
        })
      end,
    },
  },
}
