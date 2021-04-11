  let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'コマンド',
      \ 'i'      : 'インサート',
      \ 'ic'     : 'インサート',
      \ 'ix'     : 'インサート',
      \ 'n'      : '正常',
      \ 'multi'  : 'M',
      \ 'ni'     : '正常',
      \ 'no'     : '正常',
      \ 'R'      : '交換',
      \ 'Rv'     : '交換',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'ビジュアル',
      \ 'V'      : 'ビジュアル',
      \ ''     : 'ビジュアル',
      \ }


  " enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'fruit_punch'

" Always show tabs 
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Don't show bar at the top.
let g:airline#extensions#tabline#enabled = 0
