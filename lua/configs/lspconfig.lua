require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "gopls", "ts_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ async = false }) end,
      })
    end
  end,
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = "C:/Users/VennDev/.conda/envs/AI/python.exe",
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.jsx"},
  command = "setlocal filetype=javascriptreact"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.tsx"},
  command = "setlocal filetype=typescript.tsx"
})