require("bufferline").setup {
  options = {
    mode = "buffers", -- Show buffers instead of tabs
    numbers = "none", -- No buffer numbers
    close_command = "bdelete! %d", -- Close buffers with `bdelete`
    right_mouse_command = "bdelete! %d", -- Close buffer with right mouse
    left_mouse_command = "buffer %d", -- Switch buffers with left mouse
    middle_mouse_command = nil, -- No action for middle mouse
    separator_style = "slant", -- Choose style: "slant", "thick", or "thin"
    show_buffer_close_icons = true,
    show_close_icon = false,
    diagnostics = "nvim_lsp", -- Show LSP diagnostics in the tabline
    diagnostics_update_in_insert = false,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center" }
    },
  },
}

