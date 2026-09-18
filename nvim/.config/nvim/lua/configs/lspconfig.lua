require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "tailwindcss", "pyright" }
vim.lsp.enable(servers)

vim.lsp.config("*", {
  capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(),
    require("lsp-file-operations").default_capabilities()),
  handlers = {
    ["textDocument/signatureHelp"] = function()
      vim.lsp.buf.signature_help({ focusable = false })
    end,
  },
})
-- read :h vim.lsp.config for changing options of lsp servers
