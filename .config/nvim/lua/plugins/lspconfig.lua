return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }

      -- LSP
      local path = require("lspconfig.util").path

      local root = LazyVim.root()
      local is_yarn_pnp = path.is_file(path.join(root, ".pnp.cjs"))

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        vtsls = {
          init_options = { hostInfo = "neovim" },
          settings = {
            typescript = {
              tsdk = is_yarn_pnp and path.join(root, ".yarn/sdks/typescript/lib") or nil,
            },
          },
        },
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            nodePath = is_yarn_pnp and path.join(root, ".yarn/sdks") or nil,
            experimental = {
              useFlatConfig = true,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
      formatters = {
        biome = {
          -- 기본적으로는 format만 하지만 check (format + lint)도 같이 하도록 합니다.
          -- https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters/biome.lua
          args = { "check", "--fix", "--stdin-file-path", "$FILENAME" },
        },
      },
    },
  },
}
