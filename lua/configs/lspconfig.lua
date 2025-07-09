require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local servers = { "html", "cssls", "gopls" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.pyright.setup {
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

-- read :h vim.lsp.config for changing options of lsp servers 
