local path = require("lspconfig.util").path

local root = LazyVim.root()
local is_yarn_pnp = path.is_file(path.join(root, ".pnp.cjs"))

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            tsdk = is_yarn_pnp and path.join(root, ".yarn/sdks/typescript/lib") or nil,
          },
        },
      },
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          nodePath = is_yarn_pnp and path.join(root, ".yarn/sdks") or nil,
        },
      },
    },
  },
}
