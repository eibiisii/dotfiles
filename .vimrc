" Vundle設定
" ==================
" Vi互換をオフ
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()
filetype plugin on

" github上のプラグイン
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'vim-scripts/python.vim'
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'

" vim-scripts上のプラグイン
Bundle 'smooth_scroll.vim'

" 基本設定
" ===================
" エンコード
set encoding=utf-8
" 行番号を表示
set number
" 編集中のファイル名を表示
set title
" ルーラーの表示
set ruler
" バックアップ
"set backupdir=$HOME/vimbackup
" 対応括弧表示
set showmatch
" タブを常に表示
set showtabline=2
" 補完候補表示
set wildmenu
" コマンドをステータスラインに表示
set showcmd
" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
set laststatus=2

" syntax color
" =====================
syntax on
colorscheme desert

" zen-coding
let g:user_zen_expandabbr_key = '<c-e>'
"neocomplcache有効化
let g:neocomplcache_enable_at_startup = 1
"区切り補完有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
" 検索結果をハイライト
set hlsearch

" keymap
" =====================
" .vimrcを開く
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
" .vimrcを反映
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>


"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" python設定
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" perlテンプレート
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl.txt

"ステータスラインに文字コードやBOM、16進表示等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
"""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction


