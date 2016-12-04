" this script is being ln -s to ~/.config/nvim/init.vim ~/.vimrc ~/.nvimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'


Plugin 'tomtom/tcomment_vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'airblade/vim-gitgutter'

Plugin 'easymotion/vim-easymotion'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'jpo/vim-railscasts-theme'

Plugin 'scrooloose/nerdTree'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'vim-scripts/argtextobj.vim'

" new text objects
Plugin 'kana/vim-textobj-user'
" f F text objects
Plugin 'kana/vim-textobj-function'

" User defined operators/actions
Plugin 'kana/vim-operator-user'

Plugin 'michaeljsmith/vim-indent-object'

Plugin 'vimwiki/vimwiki'

Plugin 'christoomey/vim-sort-motion'

Plugin 'itchyny/calendar.vim'

Plugin 'tomasr/molokai'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' "better markdown support

Plugin 'kracejic/themeinabox.vim'

" better cooperation with tmux
Plugin 'christoomey/vim-tmux-navigator'

" gutter for marks
Plugin 'kshenoy/vim-signature'

" Vim plug for switching between companion source files (e.g. .h and .cpp)
Plugin 'derekwyatt/vim-fswitch'

Plugin 'rhysd/vim-clang-format'

" session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'gikmx/ctrlp-obsession'

" vim abolish does three things,
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
" :Subvert/blog{,s}/post{,s}/g
" coercion - crs, crc change to snake case,
"              change to camel case, cru upper case
Plugin 'tpope/vim-abolish'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kracejic/snippetinabox.vim'

Plugin 'scrooloose/syntastic'

" search with :Ack [options] {pattern] [{directories}]
Plugin 'mileszs/ack.vim'

Plugin 'vim-scripts/DoxygenToolkit.vim'


Plugin 'vim-scripts/MultipleSearch'

if hostname() =~ "build01"
    Plugin 'vim-scripts/ccase.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-scripts/ShowFunc.vim'
endif

if hostname() =~ "ankh"
    Plugin 'Valloric/YouCompleteMe'
endif
if hostname() =~ "efebe"
    Plugin 'Valloric/YouCompleteMe'
endif
if hostname() =~ "chirm"
    Plugin 'Valloric/YouCompleteMe'
endif


" Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"General
set number  "Show line numbers
set relativenumber
nmap <leader>num :set nu! <CR>:set rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling

" :imap jj <Esc>
:imap <C-L> <Esc>

set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set visualbell  "Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>

set virtualedit=onemore  "allow to go one character behind the end of the line
set autoindent  "Auto-indent new lines
set expandtab   "Use spaces instead of tabs
set shiftwidth=4    "Number of auto-indent spaces
set smartindent "Enable smart-indent
set smarttab    "Enable smart-tabs
set softtabstop=4   "Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=150          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set t_ut=

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.

" CtrlP settings
let g:ctrlp_match_window = 'top,order:ttb,max:15,results:15'
let g:ctrlp_follow_symlinks = 1
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'
nnoremap <leader>. :CtrlPBufTag<cr>
nnoremap <leader>, :CtrlPTag<cr>
nnoremap <leader>q :CtrlPQuickfix<cr>
nnoremap <Leader>ss :CtrlPObsession<CR>
nnoremap <tab> :CtrlPBuffer<CR>
nnoremap <leader>a :CtrlPBuffer<CR>
command! Ctagsgenerate :!ctags -R .

" open header fswitch
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>


" for pasting in terminal
set pastetoggle=<F2>

set splitbelow    " more natural split opening
set splitright    " more natural split opening

"split movement
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
"saner splits
nnoremap <C-w>\| <C-w>v
nnoremap <C-w>_ <C-w>s
"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+

" buffers
:nmap \] :bnext<CR>
:nmap \[ :bprev<CR>
:nmap <leader>w :bd<CR>

:command! Bd bp|bd<space>#

:nnoremap <leader>W :Bd<CR>


" syntax enable           " enable syntax processing
syntax on           " enable syntax processing

" settings for kshenoy/vim-signature, it will color the marks with gitgutter
" color
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

" " copy to buffer for sharing between vim sessions
" vmap <C-c> :w! ~/.vimbuffer<CR>
" nmap <C-c> :.w! ~/.vimbuffer<CR>
" " paste from buffer
" map <C-p> :r ~/.vimbuffer<CR>


"reload vimrc
:nmap \rv :source $MYVIMRC<CR>

" culumn guide
" if (exists('+colorcolumn'))
"     set colorcolumn=80
"     highlight ColorColumn ctermbg=1
" endif

" match the next brace
" nnoremap <tab> %
" vnoremap <tab> %

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>

" vimwiki
command! WTable :VimwikiTable
command! WToc ::VimwikiTOC
command! WTags ::VimwikiRebuildTags

if hostname() == "MD1CQ28C"
    let g:vimwiki_list = [{'path': '/d/cloud/space/source/', 'syntax': 'markdown', 'ext': '.mdw', 'auto_tags': 1}, {'path': '/d/cloud/space/source/.siemens/', 'syntax': 'markdown', 'ext': '.mdw', 'auto_tags': 1}]
elseif hostname() =~ "chirm"
    let g:vimwiki_list = [{'path': '~/ownCloud/space/source/', 'syntax': 'markdown', 'ext': '.mdw', 'auto_tags': 1}, {'path': '~/ownCloud/space/source/.siemens/', 'syntax': 'markdown', 'ext': '.mdw', 'auto_tags': 1}]
else
    let g:vimwiki_list = [{'path': '~/ownCloud/space/source/', 'syntax': 'markdown', 'ext': '.mdw', 'auto_tags': 1}]
endif

" let g:vimwiki_list = [{'path': '~/ownCloud/space/', 'path_html': '~/ownCloud/space_html/'},{'path': '~/test_vim/', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/ownCloud/space/source/', 'syntax': 'markdown', 'ext': '.md'}]

command! Spellen :setlocal spell spelllang=en_us
command! Spellcs :setlocal spell spelllang=cs
command! Spellnone :setlocal nospell


let g:calendar_google_calendar = 1



" quickfix next, prev
:nmap [q :cprev<CR>
:nmap ]q :cnext<CR>
:nmap [Q :cfirst<CR>
:nmap ]Q :clast<CR>

" Theme stuff
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
nnoremap <leader>1 :colorscheme railscasts<cr>:AirlineTheme dark<cr>
nnoremap <leader>2 :colorscheme molokai<cr>:AirlineTheme base16_monokai<cr>
nnoremap <leader>3 :colorscheme themeinabox<cr>:AirlineTheme base16_eighties<cr>
nnoremap <leader>4 :colorscheme themeinabox-light<cr>:AirlineTheme sol<cr>

" get current syntax class
nmap <leader>sy :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"goto next file
:nmap <C-`> :e#<CR>

"toc for markdown
nmap <leader>toc :g/^#/#<CR> :noh <CR>
nmap <leader>defs :g/def /#<CR> :noh <CR>

"Showfunc.vim
nmap <leader>func <Plug>ShowFunc
nmap <leader>fun <Plug>ShowFunc<CR><C-w>H
" nmap <leader>cf <Plug>(operator-clang-format)
" vmap <leader>cf <Plug>(operator-clang-format)


" CLANG FORMAT
" default settings
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
      \ "AllowShortFunctionsOnASingleLine": "Empty",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "BreakBeforeBraces": "Allman",
      \ "BreakConstructorInitializersBeforeComma": "true",
      \ "IndentCaseLabels": "true",
      \ "IndentWidth":     4,
      \ "MaxEmptyLinesToKeep": 2,
      \ "NamespaceIndentation": "Inner",
      \ "ObjCBlockIndentWidth": 4,
      \ "TabWidth": 4}

augroup ClangFormatSettings
    autocmd!
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR> zz
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR> zz
    " format line +-1
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cc :.-1,.+1ClangFormat<CR> zz
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>c <Plug>(operator-clang-format)
augroup END


:nmap \e :NERDTreeToggle<CR>
":nmap \t w setlocal wrap!<CR>:setlocal wrap?
":command Wrap setlocal wrap!<CR>:setlocal wrap?
":command :wrapt setlocal wrap!<CR>:setlocal wrap?<CR> " change wrapping

"folding

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
set foldmethod=indent   " fold based on indent level


" Paste without yanking selected
xnoremap <leader>p "_dP
" Stamp = delete current word (without yanking) and paste
nnoremap S "_diwPb
nnoremap x "_x
nnoremap X "_X


" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" move to beginning/end of line
nmap <Home> ^
nmap <End> $
" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

nnoremap gV `[v`]  " This mapping allows you to reselect the text you just pasted:
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>  " goto midle of line

" simpler function movement
nnoremap ]] ][
nnoremap [[ []


"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

if v:version > 703 || v:version == 703 && has("patch541")
      set formatoptions+=j " Delete comment character when joining commented lines
endif

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set tabpagemax=50 " max number of pages


" syntax highlighting for markdown
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


colorscheme themeinabox
let g:airline_theme='base16_eighties'

"plugins
set runtimepath^=~/.nvim/bundle/ctrlp.vim


"save with root
command! Wroot :execute ':silent w !sudo tee % > /dev/null' | :edit!
" fix typo
command! W :w


"   YCM
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/bin/rc/.ycm_extra_conf.py' 
let g:ycm_error_symbol = '%'
let g:ycm_warning_symbol = '%'
nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>yd :YcmCompleter GetDocImprecise<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yD :YcmDiags<CR>
nnoremap <leader>yR :YcmRestartServer<CR>
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


" airline
set laststatus=2
if hostname() =~ "ankh"
    let g:airline_powerline_fonts = 1
elseif hostname() =~ "chirm"
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" multicursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap <Leader>w <Plug>(easymotion-w)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" fast indentations changes
nmap <leader>t1 :set expandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>T1 :set noexpandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>T2 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T4 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t6 :set expandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>T6 :set noexpandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nmap <leader>T8 :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>

let g:syntastic_cpp_compiler_options = "-std=c++14"

" Python specific
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" search for visually selected text
vnoremap // y/<C-R>"<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" select ag as :Ack search when available
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"Work stuff
command! Ctpdiff :!cleartool diff -pre -col 190 % | less
command! Ctpdiff2 :!cleartool diff -pre -ser % | less


" Fix autocpopletions
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


" execute macro on visal range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

