-- Key mappings
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- disable the space bar key default behavior in Normal and Visual mode
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- keymap should'nt change and dont appear in bot bar
local opts = { noremap = true, silent = true }

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

--find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>b", ":<cmd> enew <CR>", { desc = "new buffer" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- После Ctrl-F (вниз на страницу) — курсор в верхнюю строку экрана
vim.keymap.set('n', '<C-F>', '<C-F>H')

-- После Ctrl-B (вверх на страницу) — курсор в верхнюю строку экрана
vim.keymap.set('n', '<C-B>', '<C-B>H')
