-- needed for dapui until fix is merged
-- https://github.com/LazyVim/LazyVim/issues/2764

return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio" }
  }
}

