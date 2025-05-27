--Loading lazy package manager
require("config.lazy")
require("oil").setup()
--Change colorscheme
vim.cmd[[colorscheme tokyonight]]
--Loading options and keymaps
require("vimoptions")
--We set up the project here
local projects = require("config.projects")

-- Check if first argument is a known project
local args = vim.fn.argv()
if #args > 0 then
    local project_path = projects[args[1]]
    if project_path and vim.fn.isdirectory(project_path) == 1 then
        vim.cmd("cd " .. project_path)
    end
end
--Open oil in correct directory
require("oil").open(vim.fn.getcwd())

