-- Check if first argument is a known project
local args = vim.fn.argv()
--Loading lazy package manager
require("config.lazy")
--Change colorscheme
vim.cmd[[colorscheme tokyonight]]
--Loading options and keymaps
require("vimoptions")

--Setup oil
require("oil").setup()
if #args > 0 then
    --We set up the project here
    local projects = require("config.projects")
    local project_path = projects[args[1]]
    print(args[1])
    print(project_path)
    if project_path and vim.fn.isdirectory(project_path) == 1 then
        vim.cmd("cd " .. project_path)
        --Open oil in correct directory
        require("oil").open(vim.fn.getcwd())
    end
end

