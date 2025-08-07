--Numbered lines
vim.opt.nu = true
--Relative numberlines
vim.opt.relativenumber = false 
--Can copy with p
vim.opt.clipboard = "unnamedplus"

--Not sure, think this changes icons?
vim.opt.guifont = "FiraCode Nerd Font:h12"

--Sets tabbing using < and > as well as normal tab to a reasonable number
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--More sane indenting when using {}
vim.opt.smartindent = true

--Changes when you start scrolling up or down, change to 8 or higher to always be in the middle
vim.opt.scrolloff = 2


--vim.diagnostic.config({float = { max_width = 10 }})

-- Enable wrapping in all floating windows (including LSP hovers, signature help, etc.)
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "*",
--  callback = function()
--    vim.opt_local.wrap = true
--  end
--})

-- Or target only diagnostics
--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--  vim.lsp.handlers.hover,
--  {
--    border = "rounded",
--    max_width = 80,
--    wrap = true, -- doesn't exist directly, but wrap=true will be respected if 'wrap' is set in the buffer
--  }
--)
























