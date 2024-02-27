return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n", "<leader>hm",
      "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        { desc = "Go to next harpoon mark" }
    )
    keymap.set(
      "n", "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" }
    )
    keymap.set(
        "n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        {desc = "Bring up Harpoon quick menu" }
    )
    keymap.set(
        "n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
        {desc = "Goto first harpooned file" }
    )
    keymap.set(
        "n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
        {desc = "Goto second harpooned file" }
    )
    keymap.set(
        "n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
        {desc = "Goto third harpooned file" }
    )
    keymap.set(
        "n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
        {desc = "Goto fourth harpooned file" }
    )
  end,
}

