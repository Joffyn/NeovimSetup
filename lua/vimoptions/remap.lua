--Set spacebar to leader
vim.g.mapleader = " "
--NetRW with space-e
vim.keymap.set("n", "<leader>e", function () vim.cmd("Oil") end)
--vim.keymap.set("n", "<leader>e", function() 
--    local file_dir = vim.fn.expand("%:p:h")  
--    require("oil").open(file_dir)
--end)
--Move highlighted stuff with ctrl-v/k
vim.keymap.set("v", "K", ":m  '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m  '>+1<CR>gv=gv")


--Function for swapping between header and cpp file
local function switch_source_header()
  local current = vim.api.nvim_buf_get_name(0)
  local alt_file

  if current:match("%.h$") then
    alt_file = current:gsub("%.h$", ".cpp")
  elseif current:match("%.hpp$") then
    alt_file = current:gsub("%.hpp$", ".cpp")
  elseif current:match("%.cpp$") then
    alt_file = current:gsub("%.cpp$", ".h")
  elseif current:match("%.cc$") then
    alt_file = current:gsub("%.cc$", ".hpp")
  end

  if alt_file and vim.fn.filereadable(alt_file) == 1 then
    vim.cmd("edit " .. alt_file)
  else
    print("No matching source/header file found")
  end
end
vim.keymap.set("n", "<A-o>", switch_source_header, { desc = "Switch between header/source" })



