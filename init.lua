-- Check if first argument is a known project
local args = vim.fn.argv()
--Loading lazy package manager
require("config.lazy")
--Change colorscheme
--vim.cmd[[colorscheme tokyonight]]
--Loading options and keymaps
require("vimoptions")

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    --["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
    --["<Tab>"] = cmp.mapping.select_next_item(),
    --["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
--Setup oil
--require("oil").setup()
--if #args > 0 then
--    --We set up the project here
--    local projects = require("config.projects")
--    local project_path = projects[args[1]]
--    print(args[1])
--    print(project_path)
--    if project_path and vim.fn.isdirectory(project_path) == 1 then
--        vim.cmd("cd " .. project_path)
--        --Open oil in correct directory
--        require("oil").open(vim.fn.getcwd())
--    end
--end

