return 
{
    {
        "neovim/nvim-lspconfig",

        --dependencies = 
        --        {
        --            'saghen/blink.cmp'
        --        },

            config = function()

                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                --local capabalities = require('blink.cmp').get_lsp_capabilities()

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
                    --capabilities = capabilities
                }
                require('lspconfig').rust_analyzer.setup {
                    capabilities = capabilities,
                    root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),

                    settings = {
                        ["rust-analyzer"] = {
                            -- Other Settings ...
                            cargo = { allFeatures = true,},
                            checkOnSave = true,
                            procMacro = {
                                    ignored = {
                                        leptos_macro = {
                                            --"server",
                                            --"component",
                                        }
                                    }}
                    }},
                }
                -- Enable inlay hints globally for LSP
                vim.api.nvim_create_autocmd("LspAttach", {
                    callback = function(args)
                        local client = vim.lsp.get_client_by_id(args.data.client_id)
                        if client.server_capabilities.inlayHintProvider then
                            vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
                        end
                    end,
                })
                
                vim.diagnostic.config({
                    virtual_text = true,
                    signs = false,
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
                
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "Yellow" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "Blue" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "Green" })

                vim.api.nvim_create_autocmd("ColorScheme", {callback = function() vim.diagnostic.config({ underline = true }) end,})

                vim.o.updatetime = 250
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = function()
                        local cursor = vim.api.nvim_win_get_cursor(0)
                        local opts = { focus = false, border = "rounded", source = "always", scope = "cursor"}
                        local _,winnr = vim.diagnostic.open_float(nil, opts)
                        if winnr ~= nil then
                        local wincon = vim.api.nvim_win_get_config(winnr)
                        wincon = vim.tbl_extend("force", wincon, { relative = "win", win = vim.api.nvim_get_current_win(), row = 0, col = vim.o.columns })
                        vim.api.nvim_win_set_config(winnr, wincon)
                        end
                    end,
                })

                vim.diagnostic.config({virtual_text = true, signs = false, underline = true, severity_sort = true, update_in_insert = true})
            end,

    }
}
