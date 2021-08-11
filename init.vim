"
"   _   _(_)_ __ ___  _ __ ___
"  / \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"
"
" Paul ADENOT -- 2011
"

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'derekwyatt/vim-fswitch'
Plug 'sjl/gundo.vim'
Plug 'othree/html5.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'aldafu/vim-widl'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

""" Standard ViM options
set hidden
set mouse=a
set nocp
set ttyfast
" , is a nice leader key
let mapleader = ","
" highlight words and numbers inside a comment
let c_comment_strings=1
" Enable syntax highlighting
syntax on
" Put a colored line at 80 characters
set colorcolumn=80
" Highlight matched pattern when searching or replacing.
set hlsearch
" Show the line numbers.
set number
" Automatic indentation for C-like languages.
set smartindent
" Write (=save) the file whenever it is compiled or when
" the user changes files in a buffer.
set autowrite
" Automatic comments
set formatoptions=tco
" Set the text width to 80 char
set textwidth=80
" Incremental search : search befor return is typed
set incsearch
set inccommand=nosplit
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
" Size of tabulatons, which are in fact spaces
set expandtab
set tabstop=2
set shiftwidth=2
" Case sensitive seach if a capital is used in the search pattern
set ignorecase
set smartcase
" Font in GUI mode : https://github.com/andreberg/Meslo-Font
set guifont=Meslo\ LG\ S\ for\ Powerline:h12
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
" The unamed register is the system's copy buffer
set clipboard=unnamedplus
" Allow backspace in insert mode like in any other text editor
set backspace=indent,eol,start 
" Set the dictionnary to french
set dictionary+="/usr/share/dict/french"
" Set the Doxygen style comments, to ease the writing of documentation
set comments=s1:/**,mb:*,ex:*/
" We will almost never open .o in vim, so remove them from matching
set wildignore+=*.o,*.obj,.git,*.swp,*.svn,*.pyc,*.rej
set wildignorecase
" Add · for trailing spaces.
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:· list
set lazyredraw
" Don't go to the start of line when using C-D and such
set nostartofline
" Cool menu which show possible autocompletion
set wildmenu
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
" Persistent undo
set undofile
set undodir=~/.vim/undodir
set showcmd

" Use TAB in normal mode to fold/unfold
set foldmethod=indent
map <Tab> za
au BufReadPost * normal zR

set makeprg="./mach build binaries"
" rg is "better than ag"
set grepprg=rg

" Set the GUI Size to one screen
au GUIEnter * set lines=48 columns=84

""" File type specific
filetype indent on
filetype plugin on
let g:spell_choices="en,fr"
" Enable spelling check on .tex and .latex files, as well as rst files
augroup filetypedetect
  au BufNewFile,BufRead {*.tex} setlocal spell nocindent
  au BufNewFile,BufRead {*.txt} setlocal spell nocindent
  au BufNewFile,BufRead {*.md,*.mdwn,*.markdown,*.mmark} setlocal spell nocindent ft=markdown
  au BufWritePost *.tex :silent !make
  au BufNewFile,BufRead *.rst set syntax=rest
  au BufNewFile,BufRead *.webidl set syntax=idl
  autocmd FileType c,cpp,python,javascript IndentGuidesEnable
  " After opening a file, put the cursor when it was last time this file was edited.
  autocmd BufReadPost * normal `"
  " SConscript & SConstruct are python
  au BufRead,BufNewFile {SConscript,SConstruct}  set ft=python
  " .rl (ragel parsing file) should be highlighted as C
  au BufRead,BufNewFile {*.rl} set ft=c
  " .ipdl (inter-process-definition-language) should be highlighted as C++
  au BufRead,BufNewFile {*.ipdl} set ft=cpp
  " highlight .sjs (server side js) as javacript
  au BufRead,BufNewFile {*.sjs} set ft=javascript
  " .inc are XML in mozilla codebase
  au BufRead,BufNewFile {*.inc} set ft=xml
  " Respect PEP8 while editing python
  au FileType python  set tabstop=4 textwidth=79
  " When using make, we shouldn't expand tabs.
  au FileType make set noexpandtab
  " treat bikeshed spec as html
  au BufRead,BufNewFile {*.bs} set ft=html noexpandtab
augroup END

" Control U toogles to Gundo panel
map <C-G> :GundoToggle<CR>

" Control tab or control-q switches between cpp an .h file, as in Eclipse
map <C-Tab> :FSHere<CR><Esc>
map <C-Q> :FSHere<CR><Esc>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


augroup mycppfiles
  au!
  au BufRead *.cpp let b:fswitchlocs = '.,../public/,../include/'
  au BufRead *.cpp let b:fswitchdst = "h,hpp"
  au BufRead *.h let b:fswitchdst  = 'cpp,cc,C,cxx'
  au BufRead *.h let b:fswitchlocs = '.,../src/'
augroup END


" Type :w!! when forgot sudo and editing a file.
cmap w!! w !sudo tee % >/dev/null
cmap Wq wq

" Disable arrows in normal mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" control+j & control+k switch buffers
noremap <C-J> :silent :bp<CR><Esc>
noremap <C-K> :silent :bn<CR><Esc>
" leader a : ack the word under cursor
nnoremap <leader>a :grep <cword><CR>

let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Press F4 or ctrl-e to clear highlighting.
map <F4> :nohl<CR>
map <C-E> :nohl<CR>

" Control-R U inserts an uuid
imap <C-r>u <C-R>=system('~/bin/uuidgen.py')<cr>

" set t_Co=256

" make w work with camelcase words
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

omap <silent> aw <Plug>CamelCaseMotion_aw
xmap <silent> aw <Plug>CamelCaseMotion_aw
omap <silent> ab <Plug>CamelCaseMotion_ab
xmap <silent> ab <Plug>CamelCaseMotion_ab
omap <silent> ae <Plug>CamelCaseMotion_ae
xmap <silent> ae <Plug>CamelCaseMotion_ae

let g:airline_powerline_fonts = 1

set sw=2
set ts=2
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level= 1
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

let g:neovide_cursor_animation_length=0.01

nmap <leader>b :Buffers<CR>
nmap <leader>p :Files .<CR>
nmap <leader>w :bd<CR>


" Color scheme.
set background=dark
colorscheme solarized8

set background=dark
colorscheme solarized8

set autowrite
