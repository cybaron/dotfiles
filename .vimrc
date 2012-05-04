" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
syntax off
filetype indent off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype plugin on
filetype on
syntax on

autocmd!
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

filetype plugin indent on
syntax on

" デザイン系
colorscheme desert
"colorscheme h2u_black
"colorscheme ir_black

set nobackup       " 自動バックアップファイルを作成しない

set ignorecase     " 大文字小文字区別なし
set smartcase      " 検索文字列に応じて大文字小文字を区別

set expandtab      " タブをスペースに置き換え
set tabstop=2      " タブ幅
set shiftwidth=2   " autoindentなどの時のタブ幅
set softtabstop=2  " タブキーで入力したときのタブ幅
set showtabline=2  " タブを常に表示

set number         " 行番号表示
set ruler          " ルーラー表示

set imdisable      " IMを無効化
set nosmartindent  " スマートインデント
set noautoindent   " オートインデント
set cursorline     " カレントにカーソルライン表示 
set backspace=indent,eol,start " BSでインデントや改行を削除できるように

" .vimrcの編集と読込
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

" :helpの読込
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" 直前に操作した文字を選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" ウィンドウの折り返し文字が長いときの移動
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ビジュアルモードで選択したテキストを、クリップボードに設定
set clipboard+=autoselect
set clipboard+=unnamedplus,unnamed

"Escの2回押しでハイライト消去
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_auto_completion_start_length = 4
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_enable_smart_case = 1
autocmd FileType text,txt :NeoComplCacheLock

" MacOS X Lion 対策
let $PYTHON_DLL="/System/Library/Frameworks/Python.framework/Versions/2.6/Python"

" ステータスラインの表示
  set laststatus=2
  set statusline=%<     " 行が長すぎるときに切り詰める位置
  set statusline+=[%n]  " バッファ番号
  set statusline+=%m    " %m 修正フラグ
  set statusline+=%r    " %r 読み込み専用フラグ
  set statusline+=%h    " %h ヘルプバッファフラグ
  set statusline+=%w    " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
  set statusline+=%y    " バッファ内のファイルのタイプ
  set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
  set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%1l   " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L    " バッファ内の総行数
  set statusline+=,
  set statusline+=%c    " 何列目にカーソルがあるか
  set statusline+=%V    " 画面上の何列目にカーソルがあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%P    " ファイル内の何％の位置にあるか

" ref-vim
let g:ref_phpmanual_path = $HOME . '/Dropbox/99_manual/php-chunked-xhtml'
let g:ref_refe_cmd = $HOME . '/Dropbox/99_manual/ruby-refm-1.9.2-dynamic/refe-1_9_2'

" VimShell
nnoremap <silent> vp :VimShellPop<CR>

" CakePHP.vim
let g:cakephp_enable_auto_mode = 1

" :Csvhl n でn番目の要素をハイライト表示
function! CSVH(x)
  execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
  execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)

" PHP文法チェック
augroup phpsyntaxcheck
  autocmd!
  autocmd BufWrite *.php w !php -l
augroup END

" Ruby文法チェック
augroup rbsyntaxcheck
  autocmd!
  autocmd BufWrite *.rb w !ruby -c
augroup END
