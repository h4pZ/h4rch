vim.cmd("let bufferline = get(g:, 'bufferline', {})")

vim.cmd("let bufferline.icon_separator_active = '▎'")
vim.cmd("let bufferline.icon_separator_inactive = '▎'")
vim.cmd("let bufferline.icon_close_tab = ''")
vim.cmd("let bufferline.icon_close_tab_modified = '●'")
vim.cmd("let bufferline.closable = v:true")

vim.cmd("hi BufferCurrent guifg=#ffffff guibg=#232323")
vim.cmd("hi BufferCurrentIndex guibg=#15161a")
vim.cmd("hi BufferCurrentMod guibg=#15161a")
vim.cmd("hi BufferCurrentSign guifg=#9dccde guibg=#232323")
vim.cmd("hi BufferCurrentTarget guibg=#232323")
