vim.g.dashboard_custom_header = {
    '        ⠀⠀⣀⣤⡤⠀⠀⠀⠀⠀⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '     ⠀⠀⠀⢀⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '  ⠀  ⠀⠀⣠⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⢸⠛⠉⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠄⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⡘⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠉⠀⠀⠀⣾⣿⣦⡀⠀⠀⠀⠀⠀',
    '    ⠀⠀⡇⠀⠀⠀⢡⠄⠀⠀⣀⣀⣀⣠⠊⠀⠀⠀⠀⡠⠞⠛⠛⠛⠛⠀⠀⠀⠀⠀',
    '    ⠀⠀⢃⠀⠀⠀⠀⠗⠚⠉⠉⠀⠈⠁⠀⠀⠀⢀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠲⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⠃⠀⠀⢠⣤⡀⠀⠀⠀⠀⣿⣿⣿⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠈⠛⠉⣴⣆⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⣇⢰⡧⣉⡉⠀⠀⢀⡀⠀⣀⣀⣠⣿⡷⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⢻⠘⠃⠈⠻⢦⠞⠋⠙⠺⠋⠉⠉⠉⢡⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⠀⠳⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀',
    '    ⠀⠀⠀⠀⠀⠀⠈⠁⢲⡄⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⡇',
    '  ⠀⠀  ⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃',
    '⠀    ⠀⠀⠀⠀⢀⡞⠁⠀⠀⣾⠀⠀⣶⠀⠀⠀⢸⣦⣴⣿⣿⣿⠛⠉⠉⠉⠉⠁⠀',
    '    ⠀⠀⢀⣀⡰⠏⠀⠀⠀⠀⠉⠀⠈⠋⠀⠀⠀⠘⣿⣿⣿⠛⠋⠀⠀⠀⠀⠀⠀⠀',
    '    ⠰⣮⣉⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠈⠉⠻⠥⠤⢤⣶⢄⠀⢀⣠⣄⠀⠀⢠⣶⣤⣄⠈⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀',
    '    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠈⠋⠁⠠⠁⠀⠈⠁⠀⠀⠀⠀⠀⠀     ',
    '                                ',
    '          『ミミッキュ』           '
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
}

vim.g.dashboard_custom_footer = {'h4pZ'}

vim.cmd('hi NonText guifg=bg')

vim.cmd('hi dashboardHeader guifg=#4e5269')
vim.cmd('hi dashboardCenter guifg=#a1d5f7')
vim.cmd('hi dashboardShortCut guifg=#a8f9c4')

