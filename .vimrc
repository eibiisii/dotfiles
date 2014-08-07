" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
filetype off

"for jslint.vim
"filetype plugin off


" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
" カラースキーム
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
set t_Co=256
" hybrid
NeoBundle 'w0ng/vim-hybrid'
" unite
NeoBundle 'Shougo/unite.vim'
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Shougo/neosnippet'
NeoBundle "Shougo/neosnippet-snippets"

" vimshell
NeoBundle 'Shougo/vimshell'
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>"

NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/syntastic'

"" neocomplcache
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" vim-flake
NeoBundleLazy 'nvie/vim-flake8', {'autoload': {'filetypes': ['python']}}

""""""" vim-scripts repos
" project.vim
NeoBundle 'project.tar.gz'
"ファイルを選択したときに左ペインを閉じる
:let g:proj_flags = "imstc"
"\Pで左ペイン（プロジェクト一覧）を復活させる
:nmap <silent> <Leader>P <Plug>ToggleProject
"プロジェクトを開いた時にプロジェクト一覧が展開された状態にする
autocmd BufAdd .vimprojects silent! %foldopen!

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap
"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
"set noincsearch
" インクリメンタルサーチ
set incsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
"set nonumber
" ルーラーを表示
"set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=trail:^
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
colorscheme jellybeans
" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
"set noexpandtab

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
" set fileencodings+=,ucs-2le,ucs-2,utf-8

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif
"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I

"----------------------------------------------------
" 独自設定
"----------------------------------------------------
" スクロール時の余白確保
set scrolloff=5
" 他で書き換えられたら自動で読み直す
set autoread
" 行番号表示
set number
" インデント
set autoindent
set nosmartindent
set cindent
set expandtab " タブをスペースに展開しない

" コマンド補完を開始するキー
set wildchar=<tab>
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
" キーバインド関係
" 行単位で移動(1行が長い場合に便利)
nnoremap j gj
nnoremap k gk
nmap ,p :set paste!<CR>
nnoremap <C-h> :vnew hoge<CR>
" .vimrcを開く
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
" .vimrcを反映
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl.txt
" ---------------------
"  search_pm
" ---------------------
noremap fg :call Search_pm('vne')&lt;ENTER>
noremap ff :call Search_pm('e')&lt;ENTER>
noremap fd :call Search_pm('sp')&lt;ENTER>
noremap ft :call Search_pm('tabe')&lt;ENTER>

" --------------------
"  load_test
" --------------------
".tを横分割した下側のウィンドウで開く場合
noremap <C-j> :call LoadTest('bel sp')<ENTER>
" perl syntax check
nnoremap <SPACE>c :!perl -wc -Ilib -It/inc %<ENTER>

" ---------------------
" autocomplpop
" ---------------------
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
" autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
" autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'

"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key

au Filetype javascript :set suffixesadd=.js
au Filetype javascript :set includeexpr=substitute(v:fname,'\\.','/','g')
