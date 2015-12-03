"
"   _   _(_)_ __ ___  _ __ ___
"  / \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
"
" Paul ADENOT -- 2011
"
call pathogen#infect()

""" Standard ViM options
set mouse=a
set nocp
set ttyfast
" , is a nice leader key
let mapleader = ","
" highlight words and numbers inside a comment
let c_comment_strings=1
" Enable syntax highlighting
syntax on
" Color scheme.
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
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
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 9
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

" SCons support
set makeprg=scons\ -u\ \.
" ag is "better than ack"
set grepprg=ag

" Set the GUI Size to one screen
au GUIEnter * set lines=48 columns=84

""" File type specific
filetype indent on
filetype plugin on
let g:spell_choices="en,fr"
" Enable spelling check on .tex and .latex files, as well as rst files
augroup filetypedetect
  au BufNewFile,BufRead {*.tex} setlocal spell nocindent
  au BufNewFile,BufRead {*.md,*.mdwn,*.markdown} setlocal spell nocindent ft=markdown
  au BufWritePost *.tex :silent !make
  au BufNewFile,BufRead *.rst set syntax=rest
  au BufNewFile,BufRead *.webidl set syntax=idl
  autocmd FileType c,cpp,python,javascript,html IndentGuidesEnable
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_guide_size = 4
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
augroup END

autocmd QuickFixCmdPost vimgrep cwindow
noremap <C-F> :grep 
"autocmd QuickFixCmdPre noremap <C-J> :cn<CR>
"autocmd QuickFixCmdPost noremap <C-J> :silent :bp<CR><Esc>


" Mapping for tabularize plugin
if exists(":Tabularize")
    noremap <Leader>a= :Tabularize /=<CR>
    noremap <Leader>a= :Tabularize /=<CR>
    noremap <Leader>z| :Tabularize /|<CR>
    noremap <Leader>z| :Tabularize /|<CR>
    noremap <Leader>z: :Tabularize /:<CR>
endif

" F5 toogles to Gundo panel
nnoremap <F5> :GundoToggle<CR>

" Tag list toggle
noremap <F6> :TagbarToggle<CR>

" Control tab switches between cpp an .h file, as in Eclipse
map <C-Tab> :FSHere<CR><Esc>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

map <C-S-]> gt
map <C-S-[> gT
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-0> :tablast<CR>

augroup mycppfiles
  au!
  au BufRead *.cpp let b:fswitchlocs = '.,../public/,../include/'
  au BufRead *.cpp let b:fswitchdst = "h,hpp"
  au BufRead *.h let b:fswitchdst  = 'cpp,cc,C,cxx'
  au BufRead *.h let b:fswitchlocs = '.,../src/'
augroup END


" Type :w!! when forgot sudo and editing a file.
cmap w!! w !sudo tee % >/dev/null

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

map <F3> :NERDTreeToggle<CR>

let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Press F4 to clear highlighting.
map <F4> :noh<CR>
" Allow to paste formatted code nicely
set pastetoggle=<F3>

" Control-R U inserts an uuid
imap <C-r>u <C-R>=system('~/bin/uuidgen.py')<cr>

" Highlight YAML preambles in Jekyll posts
autocmd BufNewFile,BufRead */_posts/*.textile,*/_posts/*.mdwn syntax match Comment /\%^---\_.\{-}---$/
" Highlight code blocks in Jekyll posts
autocmd BufNewFile,BufRead */_posts/*.textile,*/_posts/*.mdwn syntax region Comment start=/^{% highlight .* %}$/ end=/{% endhighlight %}/

" Activate syntastic. Prevent its activation for c++ because it screws up in
" Mozilla codebase. TODO: Make this work.
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ["cpp", "h", "c"]

" Nice statusbar (found here : http://paulrouget.com/e/mqpatch_vim/)
set laststatus=2
let g:mqStatusPath = substitute(system("hg root --cwd " .  getcwd()), "\n", "", "g") . "/.hg/patches/status"

function! GetCurrentMqPatch()
    if filereadable(g:mqStatusPath)
      let patchesList = readfile(g:mqStatusPath)
      if len(patchesList) > 0
        return split(patchesList[-1], ':')[1]
      endif
    endif
    return ""
endfunction

set t_Co=256

set path=,,.,../include
function! Gfw()
  let b = bufnr('')
  normal mz
  let b = bufnr('')
  wincmd w
  exe "b " . b
  normal `zgF
endfun
nnoremap ;f :call Gfw()<cr>


let g:clang_library_path="/usr/lib/llvm-3.4/lib/"

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

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.hg', 'cd %s && hg manifest']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|obj*)$'
  \ }

" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

map <C-]> :YcmCompleter GoToImprecise<CR>

" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on
