vim.api.nvim_create_user_command("Close", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd([[stopinsert]])
        vim.cmd([[bd!]])
    end
end, {})
vim.api.nvim_create_user_command("Day12", function()
    local pwd = vim.fn.getcwd()
    vim.cmd("cd /home/joffy/advcode/day12/")
    vim.cmd("terminal cargo run /home/joffy/advcode/day12/")
    --vim.cmd("cd" .. pwd)
end, {})
--Build script
vim.api.nvim_create_user_command("BuildCastle", function()
    vim.cmd("terminal bash /home/joffy/Castle/Castle/BuildProjectForLinux.sh")
end, {})
--Run Script
vim.api.nvim_create_user_command("RunCastle", function()
    vim.cmd("terminal bash /home/joffy/Castle/Castle/RunProjectOnLinux.sh")
end, {})
----Generate Clang Files
vim.api.nvim_create_user_command("GenCastle", function()
  vim.fn.jobstart({"bash", "/home/joffy/Castle/Castle/GenerateClangFiles.sh"}, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          print(line)
        end
      end
    end,
    on_stderr = function(_, data)
      if data then
        for _, line in ipairs(data) do
          vim.api.nvim_err_writeln(line)
        end
      end
    end,
  })
end, {})

--Generate Clang Files
--vim.api.nvim_create_user_command("GenCastle", function()
--    vim.cmd("bash /home/joffy/Castle/Castle/GenerateClangFiles.sh")
--end, {})
--vim.api.nvim_create_user_command("BuildCastle", function()
--  vim.fn.jobstart({"bash", "/home/joffy/Castle/Castle/BuildProjectForLinux.sh"}, {
--    stdout_buffered = true,
--    on_stdout = function(_, data)
--      if data then
--        for _, line in ipairs(data) do
--          print(line)
--        end
--      end
--    end,
--    on_stderr = function(_, data)
--      if data then
--        for _, line in ipairs(data) do
--          vim.api.nvim_err_writeln(line)
--        end
--      end
--    end,
--  })
--end, {})
----Run Castle script
--vim.api.nvim_create_user_command("RunCastle", function()
--  vim.fn.jobstart({"bash", "/home/joffy/Castle/Castle/RunProjectOnLinux.sh"}, {
--    stdout_buffered = true,
--    on_stdout = function(_, data)
--      if data then
--        for _, line in ipairs(data) do
--          print(line)
--        end
--      end
--    end,
--    on_stderr = function(_, data)
--      if data then
--        for _, line in ipairs(data) do
--          vim.api.nvim_err_writeln(line)
--        end
--      end
--    end,
--  })
--end, {})
