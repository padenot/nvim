"                                    
"   _   _(_)_ __ ___  _ __ ___ 
"  / \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__ 
"    \_/ |_|_| |_| |_|_|  \___|
"                               
"
" Paul ADENOT -- 2011


set ch=2
let c_comment_strings=1
" Enable syntax highlighting
syntax on
" Highlight matched pattern when searching or replacing.
set hlsearch
" Show the line numbers.
set number
" Automatic indentation for C-like languages.
set cindent
" Write (=save) the file whenever it is compiled or when
" the user changes files in a buffer.
set autowrite
" Automatic comments
set formatoptions=tco
set textwidth=80

" Incremental search : search befor return is typed
set incsearch
" Set the EOL format
set fileformats=unix,dos
" Tilda is set as an operator
set tildeop
" Search wrap around the entire file.
set wrapscan
" Wrap words, and break then between words only.
set linebreak
" Match pairs of symbols
set matchpairs+=<:>":"`:`
" Size of tabulatons
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab 
" Color scheme.
color slate
" Font in GUI mode.
"set guifont=Monospace\ 8
set guifont=Droid\ Sans\ Mono\ 8
set guioptions=nomenu
" Remove bottom scrolling bar.
set guioptions-=b
" Set the background of the line where the cursor is to grey.
" set cursorline
" Copy visual area to paste buffer
set go+=a
" Press F4 to turn off highlighting and clear any message already displayed.
:noremap <silent> <F4> :silent noh<Bar>echo<CR>
" Set the dictionnary to french
set dictionary+="/usr/share/dict/french"

filetype indent on

" Enable spelling check on .tex and .latex files.
augroup filetypedetect
	au BufNewFile,BufRead *.latex setlocal spell spelllang=fr
	au BufNewFile,BufRead *.tex setlocal spell spelllang=fr
	au BufNewFile,BufRead *.rst set syntax=rest
	au BufNewFile,BufRead *.rst setlocal spell spelllang=fr
augroup END

" Set the GUI Size
au GUIEnter * set lines=53 columns=84
" Set the Doxygen style comments, to ease the writing of documentation
set comments=s1:/**,mb:*,ex:*/

set nocp
filetype plugin on

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sqlite3
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+lp --fields=+iaS --extra=+q .<CR>


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType * IndentGuidesEnable

let mapleader = ","

if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>z| :Tabularize /|<CR>
    vmap <Leader>z| :Tabularize /|<CR>
endif

let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333

let g:indent_guides_guide_size = 2
