return {
    "ThePrimeagen/git-worktree.nvim",

    config = function()
        local gitworktree = require('git-worktree')
        local telescope = require('telescope')

        gitworktree.setup()
        telescope.load_extension('git_worktree')

        local keymap = vim.keymap

        keymap.set("n", "<leader>fg", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",{desc = "Telescope Git Worktree"})
        keymap.set("n", "<leader>fG", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",{desc="Telescope create Git Worktree"})

    end,
}
