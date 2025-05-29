return 
{
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").clangd.setup 
                {
                    cmd = 
                    {   
                        "clangd", "--background-index", "--clang-tidy", 
                        "--completion-style=detailed", "--header-insertion=never",
                        "--limit-results=500", "--malloc-trim"

                    },
                    root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                }
                vim.diagnostic.config({virtual_text = true, signs = false, underline = true, severity_sort = true, update_in_insert = true})
            end,

    }
}
