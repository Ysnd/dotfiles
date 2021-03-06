"------------------------------
" dein.vim
"------------------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.config/nvim/dein')

  " dein cache directory
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME . '/.config/nvim/dein/repos/github.com/Shougo/dein.vim')


  " tomlファイルのパスを記載
  let s:toml_dir  = $HOME . '/.config/nvim/dein/toml'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " tomlファイルをキャッシュ
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"
"------------------------------
" エンコーディング
"------------------------------
" vim内のエンコーディング
set encoding=utf-8
" ファイルを保存する時のエンコーディング
set fileencoding=utf-8
" ファイルを開くときのエンコーディング
set fileencodings=utf-8,cp932
" よくわからない
scriptencoding utf-8
" 一部の全角文字が崩れるのを防ぐ
set ambiwidth=double

"------------------------------
" 検索/置換
"------------------------------
" 検索する時に大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだらファイル先頭から再び検索
set wrapscan
" インクリメンタル検索
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 置換の時のgオプションをデフォルトで有効化する
set gdefault

"------------------------------
" 表示設定
"------------------------------
" 行番号を表示
set number
" カーソル位置を表示
set ruler
" カーソルのある行を強調
set cursorline
" カーソルのある列を強調
set cursorcolumn
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" 対応する括弧に僅かの間ジャンプする
set showmatch matchtime=1
" Vimの%を拡張する vim6から含まれているが初期状態では無効化されている
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "def:end,class:end"
" 画面端で行を折り返さない
set nowrap
" 不可視文字を可視化する
set list
" タブを可視化する
set listchars=tab:>-
" 行末の空白文字を可視化する
set listchars=trail:-
" 行末を可視化する
set listchars=eol:<
" ビープ音を消す
set vb t_vb=
set noerrorbells
" カラースキーム
colorscheme desert

"------------------------------
" ファイル処理関連
"------------------------------
" 保存されていないファイルがあるときは終了前に保存確認
set confirm
" 保存されていないファイルが有るときでも別のファイルを開く
set hidden
" バックアップファイル(ファイル名に~がついたファイル)を作らない
set nobackup
" 編集中の保存していないファイルのバックアップを作らない
set nowritebackup

"------------------------------
" インデント
"------------------------------
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 自動でインデントが挿入される時にズレる幅
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

"------------------------------
" 配色
"------------------------------
syntax on
colorscheme molokai

"------------------------------
" スクロール
"------------------------------
" 画面端(上下)ではなく8行余裕があるうちにスクロールする
set scrolloff=8
" 画面端(左右)ではなく16文字余裕があるうちにスクロールする
set sidescrolloff=16
" 左右のスクロール単位
set sidescroll=1
" Ctrl-d, Ctrl-uでスクロールする行数を指定
set scroll=10

"------------------------------
" コマンド補完
"------------------------------
" コマンドモードの補完候補一覧の表示
set wildmenu
" 保存するコマンド履歴の数
set history=1000

"------------------------------
" map
"------------------------------
" <Leader>をspaceに割当て
let mapleader = "\<Space>"
" Yを行末までのヤンクにする
nnoremap Y y$
" ハイライトを消す(<silent>は実行するコマンドがコマンドラインに表示されないようにする)
nnoremap <silent> <ESC><ESC> :noh<CR>

"------------------------------
" autocmd
"------------------------------
augroup my_vimrc
  autocmd!
  " jsonc comment syntax enable
  autocmd Filetype json syntax match Comment +\/\/.\+$+
  " Help Vim recognize *.sbt and *.sc as Scala files
  autocmd BufRead,BufNewFile *.sbt,*.sc set filetype=scala
augroup END
