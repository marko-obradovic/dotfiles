return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- or Lazy-load on buffer write
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
	require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format file or range (Conform)",
    },
  },
  opts = {
    -- Default format behavior
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
    -- Per filetype formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      json = { "jq" },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

