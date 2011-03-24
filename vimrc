"
"   _   _(_)_ __ ___  _ __ ___ 
"  / \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__ 
"    \_/ |_|_| |_| |_|_|  \___|
"
"
" Paul ADENOT -- 2011
"

""" Standard ViM options
" , is a nice leader key
let mapleader = ","
" highlight words and numbers inside a comment
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
" Set the text width to 80 char
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
" Case sensitive seach if a capital is used in the search pattern
set smartcase
" Color scheme.
color slate
" Font in GUI mode.
"set guifont=Monospace\ 8
set guifont=Droid\ Sans\ Mono\ 8
" remove the useless buttons from gvim
set guioptions=nomenu
" Remove menubar
set guioptions-=m
" Add vim icon and use console instead of popups
set guioptions+=ic
" Remove bottom scrolling bar.
set guioptions-=b
" Copy visual area to paste buffer
set go+=a
" Press F4 to (silently) turn off highlighting and clear any message already displayed.
map <silent> <F4> :silent noh<Bar>echo<CR>
" Allow backspace in insert mode like in any other text editor
set backspace=indent,eol,start 
" Set the dictionnary to french
set dictionary+="/usr/share/dict/french"
" Set the Doxygen style comments, to ease the writing of documentation
set comments=s1:/**,mb:*,ex:*/
" We will almost never open .o in vim, so remove them from matching
set wildignore+=*.o,*.obj,.git
" Add · for trailing spaces.
set list listchars=tab:\ \ ,trail:·

" Status bar
set statusline=%F%m%r%h%w\ %04v
set laststatus=2 

" SCons support
set makeprg=scons\ -u\ \.

" Set the GUI Size to one screen
au GUIEnter * set lines=73 columns=84
" Set nocompatible
set nocp

""" File type specific
filetype indent on
filetype plugin on
" Enable spelling check on .tex and .latex files, as well as rst files
augroup filetypedetect
	au BufNewFile,BufRead *.latex setlocal spell spelllang=fr
	au BufNewFile,BufRead *.tex setlocal spell spelllang=fr
	au BufNewFile,BufRead *.rst set syntax=rest
	au BufNewFile,BufRead *.rst setlocal spell spelllang=fr
augroup END

" SConscript & SConstruct are python
au BufRead,BufNewFile {SConscript,SConstruct}  set ft=python
" .rl (ragel parsing file) should be highlighted as C
au BufRead,BufNewFile {*.rl} set ft=c
" Respect PEP8 while editing python
au FileType python  set tabstop=4 textwidth=79
" When using make, we shouldn't expand tabs.
au FileType make set noexpandtab

""" Omnicpp
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sqlite3
" ctrl+F12 builds tags for the current project.
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


" Mapping for tabularize plugin
if exists(":Tabularize")
    noremap <Leader>a= :Tabularize /=<CR>
    noremap <Leader>a= :Tabularize /=<CR>
    noremap <Leader>z| :Tabularize /|<CR>
    noremap <Leader>z| :Tabularize /|<CR>
endif

" Indent guide configuration
autocmd FileType * IndentGuidesEnable
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333
let g:indent_guides_guide_size = 2

" F5 toogles to Gundo panel
nnoremap <F5> :GundoToggle<CR>

" Tag list toggle
noremap <F7> :TlistToggle<CR>


" Command T mappings : F6 recreates cache
noremap <F6> :CommandTFlush<CR>

