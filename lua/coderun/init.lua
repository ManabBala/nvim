local group = vim.api.nvim_create_augroup("coderun", {clear = true} )
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp"},
    callback = function()  vim.api.nvim_set_keymap("n", "<C-r>", ":w<CR> :sp<CR> :term g++ %  -o %:r.exe && %:r.exe :startinsert<CR>", { noremap = true, silent = true}) end,
    group = group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"python"},
    callback = function()  vim.api.nvim_set_keymap("n", "<C-r>", ":w<CR> :sp<CR> :term python %<CR> :startinsert<CR>", { noremap = true, silent = true}) end,
    group = group
})
