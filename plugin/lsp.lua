local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed(
{
	'rust_analyzer'
})

lsp.setup()

local lspconfig = require('lspconfig')

lspconfig.clangd.setup
{
    cmd 
    {
        "clangd", "--compile-commands-dir."
    }
}

vim.diagnostic.config(
{
    virtual_text = true,
    signs = false,
    underline = true,
    severity_sort = true,
    update_in_insert = true
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Tab
    ['<CR>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }), -- Scroll through options with Enter
    ['<Up>'] = cmp.mapping.select_prev_item(), -- Navigate up in the menu
    ['<Down>'] = cmp.mapping.select_next_item(), -- Navigate down in the menu
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Optional: Control-p for previous
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Optional: Control-n for next
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
