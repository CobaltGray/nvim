vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("v", "jk", "<ESC>") -- faster escape sequence by pressing jk quickly
keymap.set("i", "jk", "<ESC>") -- faster escape sequence by pressing jk quickly
keymap.set("n", "<leader>nh", ":nohl<CR>") -- turn off highlight search 
keymap.set("n", "x", '"_x') -- when deleting don't save in buffer
keymap.set("n", "<leader>ss", ":w<CR>") -- save buffer shortcut
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit shortcut

-- window management
keymap.set("n", "<leader>s|", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- switch this line with below in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- switch this line with above in visual mode
keymap.set("n", "J", "mzJ`z") -- joins line but keeps the cursor in the same place (rather than at the end
keymap.set("n", "<C-d>", "<C-d>zz") -- after scroll down centre the line 
keymap.set("n", "<C-u>", "<C-u>zz") -- after scroll up centre the line 
keymap.set("n", "n", "nzzzv") -- allows search terms to stay in the centre
keymap.set("n", "N", "Nzzzv") -- allows search terms to stay in the centre
keymap.set("x", "<leader>p", "\"_dP") -- when in select mode do not replace the buffer with the selected word
keymap.set("n", "<leader>y", "\"+y") -- <leader>y allows to yank to system clipboard so it can be pasted elsewhere
keymap.set("v", "<leader>y", "\"+y") -- <leader>y allows to yank to system clipboard so it can be pasted elsewhere
keymap.set("n", "<leader>Y", "\"+Y") -- <leader>y allows to yank to system clipboard so it can be pasted elsewhere

-- markdown-preview
-- keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")
-- keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { noremap = false })

vim.api.nvim_set_keymap('c', '<C-k>', 'wildmenumode() ? "<Left>" : "<Up>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<C-j>', 'wildmenumode() ? "<Right>" : "<Down>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<C-h>', 'wildmenumode() ? "<Up>" : "<Left>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<C-l>', 'wildmenumode() ? "<Down>" : "<Right>"', {expr = true, noremap=true})


-- tab managemnet using barber
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
