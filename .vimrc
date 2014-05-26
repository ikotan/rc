" vunlde.vimで管理してるpluginを読み込む
source ~/.vimrc.bundle

" プラグインに依存するアレ
source ~/.vimrc.plugins_setting

"------------------------------------------------------------
" 基本設定config
"------------------------------------------------------------
let mapleader = ","               " キーマップリーダー
set scrolloff=5                   " スクロール時の余白確保
set textwidth=0                   " 一行に長い文章を書いていても自動折り返しをしない
set autoread                      " 他で書き換えられたら自動で読み直す
set hidden                        " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    " バックスペースでなんでも消せるように
set formatoptions=lmoq            " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                      " ビープをならさない
set showcmd                       " コマンドをステータス行に表示
set showmode                      " 現在のモードを表示
set viminfo='50,<1000,s100,\"50   " viminfoファイルの設定
set modelines=0                   " モードラインは無効
set notitle                       " vimを使ってくれてありがとう

" set nobackup                     " バックアップ取らない
" set noswapfile                   " スワップファイル作らない
" set browsedir=buffer             " Exploreの初期ディレクトリ
" set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする

" OSのクリップボードを使用する
set clipboard=unnamed

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" ファイルタイプ判定をon
filetype plugin on

"------------------------------------------------------------
" 表示 apperance
"------------------------------------------------------------
set showmatch                    " 括弧の対応をハイライト
set matchpairs=(:),{:},[:],<:>   " 対応する括弧や部レース「% 」で移動
set nowrap                       " ウィンドウの幅を超える行の折り返し設定"
set number                       " 行番号表示
set list                         " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex                 " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set cursorline                   " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast

"------------------------------------------------------------
" インデントindent
"------------------------------------------------------------
set autoindent   " 自動でインデント
"set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coppffee   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

" perltidyの設定
map <Space>pt <Esc>:%! perltidy<CR>
map <Space>pp <Esc>:'<,'>! perltidy<CR>

"------------------------------------------------------------
" 補完・履歴 Complete
"------------------------------------------------------------
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

" Ex-modeでの<C-p><C-n>をzshのヒストリ補完っぽくする
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

" 補完にneocomplcacheを使う
" source ~/dotfiles/.vimrc.completion.neocomplcache

" 補完にAutoComplPopを使う
" source ~/dotfiles/.vimrc.completion.autocomplpop

"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------
" set tags
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif
set notagbsearch

"<C-t>はscreentとかぶるので削除
"tab pagesを使い易くする
" nnoremap <C-t>  <Nop>
" nnoremap <C-t>n  ;<C-u>tabnew<CR>
" nnoremap <C-t>c  ;<C-u>tabclose<CR>
" nnoremap <C-t>o  ;<C-u>tabonly<CR>
" nnoremap <C-t>j  ;<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
" nnoremap <C-t>k  gT

" tags-and-searchesを使い易くする
" nnoremap t  <Nop>
" 「飛ぶ」
" nnoremap tt  <C-]>
" 「進む」
" nnoremap tj  ;<C-u>tag<CR>
" 「戻る」
" nnoremap tk  ;<C-u>pop<CR>
" 履歴一覧
" nnoremap tl  ;<C-u>tags<CR>

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan                    " 最後まで検索したら先頭へ戻る
set ignorecase                  " 大文字小文字無視
set smartcase                   " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                   " インクリメンタルサーチ
set hlsearch                    " 検索文字をハイライト

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"sgでカーソル下のコマンドを検索
nnoremap <expr> sg ':/' . expand('<cword>') . '/'

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /r "xy;%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" s*置換後文字列/g<Cr>でカーソル下のキーワードを置換
" nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" visualモードでのs*置換後文字列/g<Cr>でカーソル下のキーワードを置換
" vnoremap <expr> s* ':substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" :Gb <args> でGrepBufferする
" command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
" nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" :Gr <args>でカレントディレクトリ以下を再帰的にgrepする
" command! -nargs=1 Gr :Rgrep <args> *<Enter><CR>
" カーソル下の単語をgrepする
" nnoremap <silent> <C-g><C-r> :<C-u>Rgrep<Space><C-r><C-w> *<Enter><CR>

" let Grep_Skip_Dirs = '.svn .git'
" let Grep_Skip_Files = '*.bak *~'

"-------------------------------------------------------------------------------
" 移動設定 move
"-------------------------------------------------------------------------------
" insert mode でjjでesc
inoremap jj <Esc>

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap w <S-e>

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"<space>j, <space>kで画面送り
" noremap <Space>j <C-f>
" noremap <Space>k <C-b>

" F2で前のバッファ
map <F2> <ESC>;bp<CR>
" F3で次のバッファ
map <F3> <ESC>;bn<CR>
" F4でバッファを削除する
map <F4> <ESC>:bnext \| bdelete #<CR>
command! Bw :bnext \| bdelete #

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap ' %

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc <C-u>normal gc<Enter>
onoremap gc <C-u>normal gc<Enter>

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Shift-hjklでフレームサイズ調整
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w>>
nnoremap <S-h> <C-w><

" git-diff-aware version of gf commands.
" http://labs.timedia.co.jp/2011/04/git-diff-aware-gf-commands-for-vim.html
" nnoremap <expr> gf  <SID>do_git_diff_aware_gf('gf')
" nnoremap <expr> gF  <SID>do_git_diff_aware_gf('gF')
" nnoremap <expr> <C-w>f  <SID>do_git_diff_aware_gf('<C-w>f')
" nnoremap <expr> <C-w><C-f>  <SID>do_git_diff_aware_gf('<C-w><C-f>')
" nnoremap <expr> <C-w>F  <SID>do_git_diff_aware_gf('<C-w>F')
" nnoremap <expr> <C-w>gf  <SID>do_git_diff_aware_gf('<C-w>gf')
" nnoremap <expr> <C-w>gF  <SID>do_git_diff_aware_gf('<C-w>gF')

" function! s:do_git_diff_aware_gf(command)
  " let target_path = expand('<cfile>')
  " if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
    " if filereadable(target_path) || isdirectory(target_path)
      " return a:command
    " else
      " " BUGS: Side effect - Cursor position is changed.
      " let [_, c] = searchpos('\f\+', 'cenW')
      " return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
    " endif
  " else
    " return a:command
  " endif
" endfunction

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------

if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sf=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sf=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sf=[4%dm
endif

syntax enable                 " ハイライト on

if has('gui_running')
    set background=light
else
    set background=dark
endif


let g:rehash256=1

" let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized


" let g:molokai_original=1
" colorscheme molokai


" colorscheme Tomorrow-Night-Eighties

" 補完候補の色づけ for vim7
hi Pmenu     ctermbg=218 ctermfg=0  guifg=#000000 guibg=#999999
hi PmenuSel  ctermbg=8   ctermfg=39
hi PmenuSbar ctermbg=0   ctermfg=9
hi PmenuSbar ctermbg=218 ctermfg=0  guifg=#000000 guibg=#FFFFFF

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye :let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Tabキーを空白に変換
set expandtab

" コンマの後に自動的にスペースを挿入
" inoremap , ,<Space>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" :Ptでインデントモード切替
" command! Pt :set paste!
nnoremap sp :set paste!<Enter>

" インサートモード中に<C-o>でyankした内容をputする
inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i

" カーソル位置の単語をyankする
nnoremap vw viw
" nnoremap vy vawy

" y9 ydで行末までヤンク
nmap y9 y$
nmap yd y$
" y0 ykで行頭までヤンク
nmap y0 y^
nmap yk y^

" カーソルから行頭まで削除
nnoremap <silent> <C-d> d0

" カーソル下の単語削除
nnoremap de diw

" カーソル下のブロック削除
nnoremap dp dap

" カーソル下のブロックコピー
nnoremap vp vip

" 全行選択
nnoremap val ggVG

" カーソルから行頭まで削除(インサートモード)
" inoremap <silent> <C-k> <Esc>lc^
" カーソルから行末まで削除(インサートモード)
inoremap <silent> <C-d> <Esc>lc$
" カーソルから行頭までヤンク(インサートモード)
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" カーソルから行末までヤンク(インサートモード)
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" 括弧を自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング
" 文字コードの変換ショートカット
noremap <space>utf :e ++enc=utf-8

" 文字コード認識はbanyan/recognize_charcode.vimへ

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8

" markdown live preview
autocmd BufRead,BufNewFile *.mkd  setfiletype markdown
autocmd BufRead,BufNewFile *.md  setfiletype markdown

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" ファイルタイプの変換ショートカット
noremap <space>ap     :setfiletype apache
" noremap <space>aspvbs     :setfiletype aspvbs
" noremap <space>c          :setfiletype c
" noremap <space>cpp        :setfiletype cpp
" noremap <space>cs         :setfiletype cs
noremap <space>css        :setfiletype css
" noremap <space>diff       :setfiletype diff
" noremap <space>eruby      :setfiletype eruby
noremap <space>html       :setfiletype html
noremap <space>java       :setfiletype java
noremap <space>js         :setfiletype javascript
noremap <space>perl       :setfiletype perl
noremap <space>php        :setfiletype php
noremap <space>python     :setfiletype python
noremap <space>ruby       :setfiletype ruby
noremap <space>haml       :setfiletype haml
noremap <space>sh         :setfiletype sh
noremap <space>sql        :setfiletype sql
" noremap <space>vb         :setfiletype vb
noremap <space>vim        :setfiletype vim
" noremap <space>wsh        :setfiletype wsh
noremap <space>xhtml      :setfiletype xhtml
noremap <space>xml        :setfiletype xml
noremap <space>yaml       :setfiletype yaml
noremap <space>zsh        :setfiletype zsh
noremap <space>scala      :setfiletype scala
