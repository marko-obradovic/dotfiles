return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('telescope').setup({
            defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
                mappings = {
                    i = {
                        -- ["<C-h>"] = "which_key"
                    },
                },
            },
            pickers = {
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                    -- the default case_mode is "smart_case"
                },
            },
        })

        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
        
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Definition (Telescope)" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find References (Telescope)" })
		vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "Goto Implementations (Telescope)" })
		vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { desc = "Goto Type Definition (Telescope)" })
		vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Document Symbols" })
		vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })

    end,
}
