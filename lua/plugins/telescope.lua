return 
{
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            print("Test")
            vim.keymap.set("n", "<leader>f", require('telescope.builtin').find_files)
        end
    }
}
