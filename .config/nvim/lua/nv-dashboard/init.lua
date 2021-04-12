
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat -F 0.1'
vim.g.dashboard_preview_file = '/home/h4pz/.config/nvim/lua/nv-dashboard/mimi.txt'
vim.g.dashboard_preview_file_height = 23
vim.g.dashboard_preview_file_width = 60

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
}

vim.g.dashboard_custom_footer = {'h4pZ'}

-- Remove ~ at the end of buffer.
vim.cmd('set fillchars=fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾')
--vim.cmd('hi NonText guifg=bg')

vim.cmd('hi dashboardHeader guifg=#4e5269')
vim.cmd('hi dashboardCenter guifg=#a1d5f7')
vim.cmd('hi dashboardShortCut guifg=#a8f9c4')

