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
                require('lspconfig').rust_analyzer.setup {
                    -- Other Configs ...
                    settings = {
                        ["rust-analyzer"] = {
                            -- Other Settings ...
                            cargo = { features = { "ssr" } },
                            procMacro = {
                                ignored = {
                                    leptos_macro = {
                                        -- optional: --
                                        -- "component",
                                        --"server",
                                    },
                                },
                            },
                        },
                    }
                }
                
                vim.diagnostic.config({
                    virtual_text = false,
                    signs = true,
                    underline = true,
                    severity_sort = true,
                    update_in_insert = true,
                    float = {
                        border = "rounded",
                        source = "always", -- show source in diagnostics
                        max_width = 80,-- optional: limits width
                        severity_sort = true,
                    }
                })

                vim.o.updatetime = 250
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = function()
                        local cursor = vim.api.nvim_win_get_cursor(0)
                        local opts = { focus = false, border = "rounded", source = "always", scope = "line"}
                        vim.diagnostic.open_float(nil, opts)
                    end,
                })

                --vim.diagnostic.config({virtual_text = true, signs = false, underline = true, severity_sort = true, update_in_insert = true})
            end,

    }
}
