return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = {
    "Cargo.toml",
    "rust-project.json",
    ".git",
  },
  on_attach = function(client, bufnr)
    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

      vim.keymap.set("n", "<leader>uh", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
      end, {
        buffer = bufnr,
        desc = "Toggle inlay hints",
      })
    end
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        bindingModeHints = {
          enable = true,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 20,
        },
        closureCaptureHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = "always",
        },
        discriminantHints = {
          enable = "fieldless",
        },
        expressionAdjustmentHints = {
          enable = "always",
          hideOutsideUnsafe = false,
          mode = "prefix",
        },
        lifetimeElisionHints = {
          enable = "skip_trivial",
          useParameterNames = true,
        },
        maxLength = 40,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "always",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
}
