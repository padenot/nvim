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
" Color scheme.
set background=dark
if has("gui_running")
  colorscheme solarized
else
  color slate
endif
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
set ignorecase
set smartcase
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
" Allow backspace in insert mode like in any other text editor
set backspace=indent,eol,start 
" Set the dictionnary to french
set dictionary+="/usr/share/dict/french"
" Set the Doxygen style comments, to ease the writing of documentation
set comments=s1:/**,mb:*,ex:*/
" We will almost never open .o in vim, so remove them from matching
set wildignore+=*.o,*.obj,.git,*.swp,*.svn,*.pyc
" Add · for trailing spaces.
set list listchars=tab:\ \ ,trail:·
set lazyredraw
set nostartofline
set modeline
set scroll=5
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set viminfo='10,:20,\"100,%,n~/.viminfo
set history=1000
set nobackup
set nowritebackup
set noswapfile
if has("persistend_undo")
  set undofile
  set undodir=~/.vim/undodir
endif

" Status bar
set statusline=%F%m%r%h%w\ %04v
set laststatus=2 

" SCons support
set makeprg=scons\ -u\ \.

" Set the GUI Size to one screen
au GUIEnter * set lines=73 columns=84
" Set nocompatible
set nocp
set ttyfast

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
" .ipdl (inte-process-definition-language) should be highlighted as C++
au BufRead,BufNewFile {*.ipdl} set ft=cpp
" highlight .sjs (server side js) as javacript
au BufRead,BufNewFile {*.sjs} set ft=javascript
" Respect PEP8 while editing python
au FileType python  set tabstop=4 textwidth=79
" When using make, we shouldn't expand tabs.
au FileType make set noexpandtab

""" Omnicpp
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
"if exists("*IndentGuidesEnable")
  autocmd FileType * IndentGuidesEnable
  let g:indent_guides_auto_colors = 1
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333
  let g:indent_guides_guide_size = 2
"endif

" F5 toogles to Gundo panel
nnoremap <F5> :GundoToggle<CR>

" Tag list toggle
noremap <F6> :TagbarToggle<CR>

" Control tab switches between cpp an .h file, as in Eclipse
map <C-Tab> :A<CR><Esc>

" Type :w!! when forgot sudo and editing a file.
cmap w!! w !sudo tee % >/dev/null

" Temporary
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <C-J> :silent :tabprev<CR><Esc>
noremap <C-K> :silent :tabnext<CR><Esc>


map <Leader>t :silent :FufCoverageFile <CR><Esc>


let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

let protodefprotogetter = "~/.vim/pullproto.pl"

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'

" Press F4 to  turn off highlighting and clear any message already displayed.
map <F4> :noh<CR>
set pastetoggle=<F3>

let g:mqStatusPath = getcwd() . "/.hg/patches/status"

function! GetCurrentMqPatch()
    if filereadable(g:mqStatusPath)
      let patchesList = readfile(g:mqStatusPath)
      if len(patchesList) > 0
        return split(patchesList[-1], ':')[1]
      endif
      return ""
    endif
endfunction

set statusline=%{GetCurrentMqPatch()}\ %F%m%r%h%w
