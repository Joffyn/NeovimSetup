vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "K", ":m  '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m  '>+1<CR>gv=gv")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>p", "\"_d")
vim.keymap.set("n", "<leader>t", ":ToggleTerm size=10 direction=horizontal name=home<CR>")
--vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--function() _G.set_terminal_keymaps()
--    local opts = {buffer = 0}
--end

--vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', function()
  local api = require("nvim-tree.api")
  local view = require("nvim-tree.view")

  if view.is_visible() then
    -- If the cursor is in the tree, move to the previous window
    if vim.fn.win_getid() == view.get_winnr() then
      vim.cmd("wincmd p")
    else
      -- Otherwise, move the cursor to the tree
      api.tree.focus()
    end
  else
    -- If the tree is not visible, open it and focus on it
    api.tree.open()
  end
end, { noremap = true, silent = true })

