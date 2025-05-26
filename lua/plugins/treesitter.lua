
-- lua/plugins/treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "cpp", "c", "lua", "bash", "cmake", "json", "yaml", "python", "make", -- core languages
        -- Unreal-specific (header files mostly fall under c/cpp)
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    })
  end,
}
