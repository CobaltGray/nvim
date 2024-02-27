return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- config = true,
  config = function()
    local gs = require('gitsigns')
    gs.setup({
        on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
        if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>Gs', gs.stage_hunk, {desc = "Gitsigns stage hunk"})
        map('n', '<leader>Gr', gs.reset_hunk, {desc = "Gitsigns reset hunk"})
        map('v', '<leader>Gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Gitsigns stage hunk (Visual Mode)"})
        map('v', '<leader>Gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Gitsigns reset hung (Visual Mode)"})
        map('n', '<leader>GS', gs.stage_buffer,{desc = "Gitsigns stage buffer"})
        map('n', '<leader>Gu', gs.undo_stage_hunk, {desc = "Gitsigns undo stage hunk"})
        map('n', '<leader>GR', gs.reset_buffer, {desc = "Gitsigns reset buffer"})
        map('n', '<leader>Gp', gs.preview_hunk, {desc = "Gitsigns Preview Hunk"})
        map('n', '<leader>Gb', function() gs.blame_line{full=true} end)
        map('n', '<leader>Gb', gs.toggle_current_line_blame, {desc = "Gitsigns toggle line blame"})
        map('n', '<leader>Gd', gs.diffthis, {desc = "Gitsigns diff this"})
        map('n', '<leader>GD', function() gs.diffthis('~') end, {desc = "Gitsigns diff with HEAD"})
        map('n', '<leader>td', gs.toggle_deleted, {desc = "Gitsigns toggle deleted"})

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
    })
  end,
}

