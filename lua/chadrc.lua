-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      return {
        fileInfo = function()
          local fn = vim.fn
          local sep = "%#St_file_sep#"
          local icon = "  "
          local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"
          local modified_indicator = vim.bo.modified and " " or ""
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")
          if devicons_present then
            local ft_icon = devicons.get_icon(filename)
            icon = (ft_icon ~= nil and " " .. ft_icon) or ""
          end
          return icon .. filename .. modified_indicator
        end,
        git = st_modules.git,
        LSP_Diagnostics = st_modules.LSP_Diagnostics,
        cursor_position = st_modules.cursor_position,
      }
    end,
  },
}

M.base46 = {
	theme = "github_dark",
	transparency = true,

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.plugins = {
  override = {
    ["neovim/nvim-lspconfig"] = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
