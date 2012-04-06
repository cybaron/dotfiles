if has('gui_macvim')
    set transparency=20   " 透明度を指定
    map <silent> gw :macaction selectNextWindow:
    map <silent> gW :macaction selectPreviousWindow:
endif

set lines=45
set columns=100
"set guifont=Takaoゴシック:h14
set guifont=Ricty:h14

colorscheme desert
"colorscheme h2u_black

"日本語入力中のカーソルの色
highlight Cursor guifg=NONE guibg=Green
highlight CursorIM guifg=NONE guibg=Red

