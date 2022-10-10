local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = ' '
-- INSERT __
map("i", "<C-s>", '<ESC>:w<CR>', opts)
map("i", "<m-\\>", '<ESC>la', opts)
map("i", "<C-h>", "<C-o>h", opts)
map("i", "<C-j>", "<C-o>j", opts)
map("i", "<C-k>", "<C-o>k", opts)
map("i", "<C-l>", "<C-o>l", opts)

-- duplicater current line to  bottom(will sort later)
map("i", "<C-m>", "<ESC>0yyp$a",opts)

-- NORMAL --
-- go to config dir 
map("n", "<C-c>", [[:cd C:\Users\Arjun\AppData\Local\nvim<CR>]], opts)
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Neotree --
map('n', '<leader>e', ':NeoTreeFocusToggle<CR>', opts)
-- Terminal --
map('n', '<C-\\>', ':ToggleTerm direction=float<CR>', opts)
map('t', '<C-\\>', '<Cmd>ToggleTerm direction=float<CR>', opts)

-- Cphelper.nvim --
map('n', '<leader>r', ':CphReceive<CR>', opts)
map('n', '<leader>t', ':CphTest<CR>', opts)

-- basic functions --
map("n", "<leader>w", ':up<CR>', opts)
map("n", "<C-s>", ':w<CR>', opts)
map("n", "<leader>q", ':q<CR>', opts)


-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<m-.>", ":bnext<CR>", opts)
map("n", "<m-,>", ":bprevious<CR>", opts)
map("n", "<leader>c", ":bdelete<CR>", opts)
map("n", "<m-<>", ":BufferLineMovePrev<CR>", opts)
map("n", "<m->>", ":BufferLineMoveNext<CR>", opts)

map('n', '<m-1>', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<m-2>', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<m-3>', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<m-4>', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<m-5>', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<m-6>', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<m-7>', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<m-8>', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<m-9>', ':BufferLineGoToBuffer 9<CR>', opts)


-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "p", '"_dP', opts)
-- telescope --
 map("n", "<leader>f", ":Telescope find_files<cr>", opts)
--map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<c-t>", ":Telescope live_grep<cr>", opts)
