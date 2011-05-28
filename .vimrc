" 行番号を表示
set number

" 編集中のファイル名を表示
set title

" ルーラーの表示
set ruler

filetype off

""" Vundle '''
set rtp+=~/.vim/vundle/
call vundle#rc()
filetype plugin on

Bundle 'gmarik/vundle'

