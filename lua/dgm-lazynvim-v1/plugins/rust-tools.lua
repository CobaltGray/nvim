return {
  "simrat39/rust-tools.nvim",
  lazy = true,
  ft="rust",
  opts = function()
    return {
      tools = {
        on_initialized = function()
          vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
        end,
      },
    }
  end,
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local rt = require("rust-tools")

    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                keymap.set("n", "<leader>dd", rt.hover_actions.hover_actions, { buffer = bufnr , desc="Hover action on item"})
                -- Code action groups
                keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr , desc="code action group"})
                keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", {remap=false, silent=true, desc="Rust Runnable"})
                keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",{noremap=true, silent=true, desc="Goto Declaration"})
                keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",{noremap=true, silent=true, desc="Goto definition"})

            end,
        },
        tools = {
            hover_actions = {
                auto_focus = true,
            },
        },
    })
  end,

}
