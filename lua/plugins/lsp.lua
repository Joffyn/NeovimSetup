return 
{
    {
        "neovim/nvim-lspconfig",

        dependencies = 
                {
                    'saghen/blink.cmp'
                },

        config = function()

            local capabalities = require('blink.cmp').get_lsp_capabilities()

            require("lspconfig").clangd.setup 
                {
                    cmd = 
                    {   
                        "clangd", "--compile-commands-dir=/home/joffy/Unreal/" ,"--background-index", "--clang-tidy", 
                        "--completion-style=detailed", "--header-insertion=never",
                        "--limit-results=500", "--malloc-trim"

                    },
                    root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                    capabilities = capabilities
                }
                vim.diagnostic.config({virtual_text = true, signs = false, underline = true, severity_sort = true, update_in_insert = true})
            end,

    }
}
