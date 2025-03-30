return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Keymaps
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }

    -- LSP
    local path = require("lspconfig.util").path

    local root = LazyVim.root()
    local is_yarn_pnp = path.is_file(path.join(root, ".pnp.cjs"))

    opts.servers = opts.servers or {}

    opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
      init_options = { hostInfo = "neovim" },
      settings = {
        typescript = {
          tsdk = is_yarn_pnp and path.join(root, ".yarn/sdks/typescript/lib") or nil,
        },
      },
    })

    opts.servers.eslint = vim.tbl_deep_extend("force", opts.servers.eslint or {}, {
      settings = {
        workingDirectories = { mode = "auto" },
        nodePath = is_yarn_pnp and path.join(root, ".yarn/sdks") or nil,
      },
    })
  end,
}
