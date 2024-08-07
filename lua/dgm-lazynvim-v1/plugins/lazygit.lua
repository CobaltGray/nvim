-- nvim v0.8.0
return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set(
            "n", "<leader>lg",
            "<cmd>LazyGit<cr>", {desc = "Launch LazyGit"}
        )
    end,
}
