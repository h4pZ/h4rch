vim.api.nvim_set_keymap("n", "<leader>Du", ":DBUIToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>Df", ":DBUIFindBuffer<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>Dr", ":DBUIRenameBuffer<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>Dl", ":DBUILastQueryInfo<CR>", {noremap=true, silent = true})
