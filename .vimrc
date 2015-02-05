set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'scrooloose/nerdtree'

" 補完用言語別辞書
NeoBundle 'nishigori/vim-php-dictionary'

" 任意の文字で選択範囲を囲うプラグイン
NeoBundle 'tpope/vim-surround'

" HTML,CSS入力支援プラグイン
NeoBundle 'mattn/emmet-vim'

call neobundle#end()



filetype plugin indent on

"行番号を表示
set number
" delete keyの挙動を設定
set backspace=start,eol,indent

" コードのカラー設定
highlight Pmenu     ctermbg=4
highlight PmenuSel  ctermbg=1
highlight PMenuSbar ctermbg=4

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
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif



