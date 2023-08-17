if 1
    set nocompatible
    filetype off

    if has('vim_starting')
        " NeoBundleの設定
        set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/.vim/bundle/'))

    endif

    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'
    "NeoBundle 'Shougo/neocomplcache'
    "NeoBundle 'Shougo/neosnippet'
    "NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'scrooloose/syntastic.git'

    " 補完用言語別辞書
    NeoBundle 'nishigori/vim-php-dictionary'

    " 任意の文字で選択範囲を囲うプラグイン
    NeoBundle 'tpope/vim-surround'

    " HTML,CSS入力支援プラグイン
    " NeoBundle 'mattn/emmet-vim'

    " カッコを自動的に閉じる
    NeoBundle 'Townk/vim-autoclose'

    call neobundle#end()

    " 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
    " 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
    NeoBundleCheck

    " filetype plugin indent on

    "色を付ける
    syntax on
    "行番号を表示
    set number
    " delete keyの挙動を設定
    set backspace=start,eol,indent
    " インデントの設定
    set tabstop=4
    set autoindent
    set expandtab
    set shiftwidth=4
    "タブ、空白、改行の可視化
    set list
    set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
    set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
    "256色使えるようにする
    set t_Co=256

    " コードのカラー設定
    highlight Pmenu     ctermbg=4
    highlight PmenuSel  ctermbg=1
    highlight PMenuSbar ctermbg=4

    " 全角スペースをハイライト表示
    function! ZenkakuSpace()
        highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
    endfunction

    if has('syntax')
        augroup ZenkakuSpace
            autocmd!
            autocmd ColorScheme       * call ZenkakuSpace()
            autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
        augroup END
        call ZenkakuSpace()
    endif

    " 文字コードの設定
    set encoding=utf-8
    set fileencodings=utf-8,cp932,euc-jp,sjis
    set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
    " set ff=unix
    " ステータスラインの表示
    set statusline=%f%=[%{(&fenc!=''?&fenc:&enc)}][%{&ff}]

    " 改行コードCRLFがわかるように無理やり^Mを表示する
    autocmd BufNewFile,BufRead *.php edit ++ff=unix

    "-------------------------------------------------
    " neocomplcache設定
    "-------------------------------------------------
    " 辞書ファイル
    set dictionary=~/.vim/bundle/vim-php-dictionary/dict/PHP.dict
    autocmd FileType php,tpl :set dictionary=~/.vim/bundle/vim-php-dictionary/dict/PHP.dict
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_manual_completion_start_length = 0
    let g:neocomplcache_caching_percent_in_statusline = 1
    let g:neocomplcache_enable_skip_completion = 1
    let g:neocomplcache_skip_input_time = '0.5'

    "-------------------------------------------------
    " neosnippet設定
    "-------------------------------------------------
    """ Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "    \ "\<Plug>(neosnippet_expand_or_jump)"
    "    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "    \ "\<Plug>(neosnippet_expand_or_jump)"
    "    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " キーマップ
    " Ctl + cでスペニットの補完ウィンドウを閉じる
    inoremap <expr><C-c> neocomplcache#smart_close_popup()."\<C-c>"
    " Ctl + wでスペニットの補完ウィンドを閉じて保存
    inoremap <expr><C-w> neocomplcache#smart_close_popup()."<Esc>:w<CR>\<C-w>"

    "-------------------------------------------------
    " netrw設定
    " ファイルツリー
    "-------------------------------------------------

    " ツリー表示スタイル
    let g:netrw_liststyle = 3

    " 起動時にツリー表示
    autocmd VimEnter * Lex | vertical resize 40 | winc l

    " ツリー表示キーマップ
    inoremap <C-s> <Esc>:Lex<CR>:vertical resize 40<CR>
    nnoremap <C-s> <Esc>:Lex<CR>:vertical resize 40<CR>
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif
