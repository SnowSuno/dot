return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local command_resolver = require("null-ls.helpers.command_resolver")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          dynamic_command = command_resolver.from_yarn_pnp(),
        }),

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.mlint,
        -- require("none-ls.diagnostics.eslint_d"),
      },
    })
  end,
}
