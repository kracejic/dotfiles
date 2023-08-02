" vim: set ft=vim:
" this script is being ln -s to ~/.config/nvim/init.vim ~/.vimrc ~/.nvimrc
" set nocompatible              " be iMproved, required
" filetype off                  " required
set mouse=
autocmd BufEnter * set mouse=

if exists('py2') && has('python')
elseif has('python3')
endif

if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !wget -P ~/.config/nvim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
     silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plug 'tpope/vim-fugitive'

" Automatically adjust indentation
Plug 'tpope/vim-sleuth'

" :GV - commit browser
" :GV! only commits for current file
"  o or <cr> on a commit to display the content of it
"  o or <cr> on commits to display the diff in the range
"  O opens a new tab instead
"  gb for :Gbrowse
"  ]] and [[ to move between commits
"  . to start command-line with :Git [CURSOR] SHA à la fugitive
"  q to close
Plug 'junegunn/gv.vim'

Plug 'tpope/vim-surround'


Plug 'tomtom/tcomment_vim'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'

Plug 'terryma/vim-multiple-cursors'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'jpo/vim-railscasts-theme'

Plug 'scrooloose/nerdTree'

Plug 'vim-scripts/indentpython.vim'

" aa ia - around argument, in argument
Plug 'vim-scripts/argtextobj.vim'

" Alt+c - modify color
" Alt+r - insert new color RGB
" Alt+2 - insert new color RGBA
" :ColorPicker - color picker
" origin: KabbAmine/vCoolor.vim
Plug 'kracejic/vcoolor.vim'

" new text objects
Plug 'kana/vim-textobj-user'
" f F text objects
Plug 'kana/vim-textobj-function'
" User defined operators/actions
Plug 'kana/vim-operator-user'
Plug 'michaeljsmith/vim-indent-object'


Plug 'vimwiki/vimwiki'

" gs
Plug 'christoomey/vim-sort-motion'

Plug 'tomasr/molokai'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pearofducks/ansible-vim'

" :Tabularize
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' "better markdown support


" better cooperation with tmux
Plug 'christoomey/vim-tmux-navigator'

" gutter for marks
Plug 'kshenoy/vim-signature'

" Vim Plug for switching between companion source files (e.g. .h and .cpp)
Plug 'derekwyatt/vim-fswitch'

Plug 'rhysd/vim-clang-format'
Plug 'sbdchd/neoformat'

" session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'

" vim abolish does three things,
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
" :Subvert/blog{,s}/post{,s}/g
" coercion - crs, crc change to snake case,
"              change to camel case, cru upper case
Plug 'tpope/vim-abolish'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kracejic/snippetinabox.vim'

Plug 'scrooloose/syntastic'

Plug 'majutsushi/tagbar'

Plug 'joereynolds/gtags-scope'

" nice search in files, nice for massreplace
Plug 'dyng/ctrlsf.vim'
" :FS [pattern]


" search with :Ack [options] {pattern] [{directories}]
Plug 'mileszs/ack.vim'

" :Dox command generates stub for doxygen doc in C++, etc
Plug 'vim-scripts/DoxygenToolkit.vim'

" :Search :SearchBuffers :SearchReset :SearchBuffersReset
" <Leader>*
Plug 'vim-scripts/MultipleSearch'

" fast searching
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ga / gaip= align in paragraph around char =
Plug 'junegunn/vim-easy-align'

" :ColorToggle
Plug 'lilydjwg/colorizer'

" Syntaxes for a lot of languages
Plug 'sheerun/vim-polyglot'

" Increment - \a
Plug 'vim-scripts/visual-increment'

" :Delete, :Unlink, :Move, :Rename, :Chmod, :Mkdir, :Find, :Locate, :SudoWrite, :SudoEdit
Plug 'tpope/vim-eunuch'

"Run interactive:
":DB sqlite:myfile.sqlite3
"
"Run commands
":DB sqlite:myfile.sqlite3 select count(*) from widgets
":DB redis:/// CLIENT LIST
"
"Save DBs locations
":DB g:prod = postgres://user:pass@db.example.com/production_database
":DB g:prod drop table users
"
"Give a range to run part or all of the current buffer as a query.
":%DB mysql://root@localhost/bazquux
Plug 'tpope/vim-db'

Plug 'Yggdroot/indentLine'

Plug 'skywind3000/asyncrun.vim'


" Source: https://github.com/madox2/vim-ai
" echo "YOUR_OPENAI_API_KEY" > ~/.config/openai.token
" :AI         complete text
" :AIEdit     edit text
" :AIChat     continue or open new chat
" :AIRedo     repeat last AI command
" :AINewChat  open new chat
" :help vim-ai
" https://platform.openai.com/account/billing/overview
Plug 'madox2/vim-ai'
let initial_prompt =<< trim END
>>> system

You are going to play a role of a completion engine.
Write simple code that will work.
You will provide compact code/text completion, generation, transformation or explanation
Topic: general programming and text editing.
Do not provide any coments, just the code.
When ask to edit the code, provide just the code, do not provide an explanation.
END

let chat_engine_config = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": initial_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}

let g:vim_ai_complete = chat_engine_config
" let g:vim_ai_edit = chat_engine_config

" custom command that provides a code review for selected code block
function! CodeReviewFn(range) range
  let l:prompt = "programming syntax is " . &filetype . ", suggest how to improve following code: \n"
  let l:config = {
  \  "options": {
  \    "initial_prompt": ">>> system\n You will try to find ways how to simplify it and make it more readable and efficient. If you notice errors, you will describe the errors. ",
  \  },
  \}
  '<,'>call vim_ai#AIChatRun(a:range, l:config, l:prompt)
endfunction
command! -range AIReview <line1>,<line2>call CodeReviewFn(<range>)


" custom command for regular AI
function! RegularAI(range) range
  let l:prompt = ""
  let l:config = {
  \  "options": {
  \  "engine": "chat",
  \    "initial_prompt": "",
  \    "model": "gpt-3.5-turbo",
  \    "max_tokens": 1000,
  \    "temperature": 0.1,
  \    "request_timeout": 20,
  \    "selection_boundary": "",
  \  },
  \  "ui": {
  \    "paste_mode": 1,
  \  },
  \}
  '<,'>call vim_ai#AIRun(a:range, l:config, l:prompt)
endfunction
command! -range AIi <line1>,<line2>call RegularAI(<range>)
" command! AIi call RegularAI(getline('.'))


" New autocomplete
" Async support
Plug 'prabirshrestha/async.vim'
" Async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" Provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
" Add suport for languages
Plug 'mattn/vim-lsp-settings'
" Support snippets
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" make clipboard working with sway
" "&y ... - pastebuffer
Plug 'kana/vim-fakeclip'
let g:fakeclip_provide_clipboard_key_mappings = 1

" Plug 'artur-shaik/vim-javacomplete2'

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

let g:build_window_height = 15
call SourceIfExists("~/.vimrc.local")
call SourceIfExists("./.vimrc.local")

let g:colorizer_startup = 0


Plug 'kracejic/themeinabox.vim'

" Plug 'CoatiSoftware/vim-sourcetrail'

" Bin
" Plug 'itchyny/calendar.vim'
" Plug 'Yggdroot/indentLine'




" All of your Plugins must be added before the following line
call plug#end()

packadd termdebug
":Termdebug ../build/source/unittest/unittests -cd test<CR>
"help termdebug-starting

" Use of the filetype plugins, auto completion and indentation support
" filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on
set nocompatible
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------------------------------------
" Key shortcuts in VIM
" !! bash output on screen, current line is stdin


"General
" set number  "Show line numbers
" set relativenumber
set nonu
set nornu
nmap <leader>num :set nu! <CR>:set rnu!<CR>
nmap <leader>gnum :set g:nu! <CR>:set g:rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling
set noswapfile  " turn off swapfiles

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
" set maxmempattern=20000
set redrawtime=500

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>

" get rid of red curly braces
let c_no_curly_error=1


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
set previewheight=7

set fillchars+=vert:│         " nicer vert split separator
set fillchars+=stlnc:-        " nicer separator for horizontal split

if has('gui_running')
  set guifont=Iosevka\ Term\ 12
endif

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

"Fuzzy search
if isdirectory("/mingw32")
    " CtrlP settings
    let g:ctrlp_match_window = 'top,order:ttb,max:15,results:15'
    let g:ctrlp_follow_symlinks = 1
    "let g:ctrlp_switch_buffer = 0
    "let g:ctrlp_working_path_mode = 0
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
    let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'
    let g:ctrlp_working_path_mode = 'a'

    nnoremap <leader>. :CtrlPBufTag<cr>
    nnoremap <leader>, :CtrlPTag<cr>
    nnoremap <leader>q :CtrlPQuickfix<cr>
    nnoremap <Leader>ss :CtrlPObsession<CR>
    nnoremap <leader>a :CtrlPBuffer<CR>
    nnoremap <leader><tab> :CtrlPBuffer<CR>
else
    let g:ctrlp_map = '<leader><c-p>'
    " Default fzf layout
    " - down / up / left / right
    let g:fzf_layout = { 'down': '~50%' }
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    " command! GGFiles call fzf#run(fzf#wrap({'source': 'if [ -d .git ] ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else  find . ; fi', 'sink': 'e'}))
    command! GGFiles call fzf#run(fzf#wrap({'source': 'if git rev-parse --git-dir > /dev/null ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else  find . ; fi', 'sink': 'e'}))
    " command! GGFiles call fzf#run(fzf#wrap({'source': 'git ls-files -co --exclude-standard', 'sink': 'e'}))
    " command! GGFiles call fzf#run(fzf#wrap({'source': 'git ls-files -co --exclude-standard', 'sink': 'e'}))

    nnoremap <C-p> :GGFiles<cr>
    " nnoremap <C-p> :CtrlP<cr>
    nnoremap <leader>. :BTags<cr>
    nnoremap <leader>, :Tags<cr>
    nnoremap <leader>q :CtrlPQuickfix<cr>
    nnoremap <Leader>ss :CtrlPObsession<CR>
    nnoremap <leader>a :Buffers<CR>
    nnoremap <leader><tab> :Buffers<CR>
    " fzf
    nnoremap <Leader><Leader> :Commands<CR>
    nnoremap <leader>L :Lines<cr>
    nnoremap <leader>l :BLines<cr>
    nnoremap <leader>ft :Filetype<cr>
    " TODO \* usage of word with :Lines and :Ag

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

command! Ctagsgenerate :!ctags -R .
command! Gtagsgenerate :!gtags
" let GtagsCscope_Auto_Load = 1
" find references
nnoremap <leader>ygr "zyiw:cs find c <C-r>z<CR>

" Git-fugitive stuff
nmap <leader>g :Gstatus<cr>gg<C-n>
nmap <leader>go :Gstatus<cr>gg<C-n>

" open header fswitch
nmap <silent> <F4> :FSHere<cr>
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F5> :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
" let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0

" for pasting in terminal
set pastetoggle=<F2>

nnoremap <leader>a <C-A>
" vnoremap <leader>a <Plug>VisualIncrement
" vnoremap <silent> <Plug><leader>a :<C-U>call <SID>doincrement(v:count1)<CR>
" vnoremap <silent> <leader>a :<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <leader>a g<C-a>
" increment numbers
noremap + <c-a>
noremap - <c-x>


" Splits
set splitbelow    " more natural split opening
set splitright    " more natural split opening
"split movement
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
tnoremap <C-h> <C-w>h
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
"saner splits
nnoremap <C-w>\| <C-w>v
nnoremap <C-w>_ <C-w>s
"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+
nnoremap <C-w><C-w><C-w>h <C-w><
nnoremap <C-w><C-w><C-w>l <C-w>>
nnoremap <C-w><C-w><C-w>k <C-w>-
nnoremap <C-w><C-w><C-w>j <C-w>+

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>


" buffers
nmap \] :bnext<CR>
nmap \[ :bprev<CR>
nmap <leader>w :bd<CR>
command! Bda :bufdo bd
nnoremap <bs> <c-^>
command! Bd bp|bd<space>#
nnoremap <leader>W :Bd<CR>

" syntax enable           " enable syntax processing
syntax on           " enable syntax processing

" settings for kshenoy/vim-signature, it will color the marks with gitgutter
" color
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

"reload vimrc
:nmap \rv :source $MYVIMRC<CR>

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vimwiki
command! WTable :VimwikiTable
command! WToc :VimwikiTOC
command! WTags :VimwikiRebuildTags




" z= choose spell          ]s [s move
" zg add to spellfile      zw add as bad,           zug/zuw remove from spellfile
set spellfile=~/.vim/spell.misc.utf-8.add
command! Spellen :setlocal spell spelllang=en_us
command! Spellcs :setlocal spell spelllang=cs
command! Spellnone :setlocal nospell
command! ColorPicker :VCoolor


let g:calendar_google_calendar = 1



" quickfix open
:nmap gqf :copen 20<CR>
command Quickfix :copen 20<CR>
command QF :copen 20<CR>
command Qf :copen 20<CR>
command QFF :cclose 20<CR>
command Qff :cclose 20<CR>
" quickfix next, prev
:nmap [q :cprev<CR>
:nmap ]q :cnext<CR>
:nmap [Q :cfirst<CR>
:nmap ]Q :clast<CR>

" location list next, prev
:nmap [e :lprev<CR>
:nmap ]e :lnext<CR>
:nmap [E :lfirst<CR>
:nmap ]E :llast<CR>

" Theme stuff
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
nnoremap <leader>1 :colorscheme railscasts<cr>:AirlineTheme dark<cr>
nnoremap <leader>2 :colorscheme molokai<cr>:AirlineTheme minimalist<cr>
nnoremap <leader>3 :colorscheme themeinabox<cr>:AirlineTheme bubblegum<cr>
nnoremap <leader>4 :colorscheme themeinabox-light<cr>:AirlineTheme sol<cr>
nnoremap <leader>5 :colorscheme themeinabox-transparent<cr>:AirlineTheme bubblegum<cr>
nnoremap <leader>6 :colorscheme themeinabox-blue<cr>:AirlineTheme base16_grayscale<cr>

" get current syntax class
nmap <leader>sy :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! SynMerge()
    syntax region MergeLocal start="<<<<<<< " end=">>>>>>> .*$" contains=MergeBase,MergeRemote,MergeLocalHEAD
    syntax region MergeLocal start="<<<<<<< " end=">>>>>>> .*$" contains=MergeBase,MergeRemote,MergeLocalHEAD contained
    syntax match MergeLocalHEAD "<<<<<<< .*$" contained
    syntax region MergeBase start="||||||| " end=">>>>>>> .*$" contains=MergeRemote,MergeBaseHEAD
    syntax match MergeBaseHEAD "||||||| .*$" contained
    syntax region MergeRemote start="=======" end=">>>>>>> .*$" contains=MergeRemoteHEAD
    syntax match MergeRemoteHEAD ">>>>>>> .*$" contained
endfunction
command! SynMerge :call SynMerge()

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

" duplicate lanes TODO
nmap <leader>dd :s/\(^.*$\)/\1\r\1/<CR>:noh<CR>
xmap <leader>dd :'<,'>s/\(.*\)/\1\r\1/<CR>:noh<CR>

" New line in normal mode
" nnoremap <CR> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" json indent
command! -range -nargs=0 -bar IndentJson <line1>,<line2>!python -m json.tool
command! -range -nargs=0 -bar JsonIndent <line1>,<line2>!python -m json.tool

"xml indent
command! IndentXml :silent %!xmllint --encode UTF-8 --format -
command! XmlIndent :silent %!xmllint --encode UTF-8 --format -

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
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc,java,javascript map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType c,cpp syntax clear cppSTLconstant

    autocmd FileType vimwiki nmap <leader>tts :TaskWikiMod +sprint<CR>
    autocmd FileType vimwiki nmap <leader>ttS :TaskWikiMod -sprint<CR>

    " autocmd FileType markdown set cole=0
    " au BufNewFile,BufRead *.mdw set nowrap
    " au BufNewFile,BufRead,BufAdd *.md set cole=0
augroup END

let g:indentLine_char = '┊'
" let g:indentLine_setConceal = 0
" let g:indentLine_enabled = 0
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 0
" let g:indentLine_fileTypeExclude = ['markdown']
let g:indentLine_fileType = ["yaml","yml","json","cpp","py","js","c"]
" :IndentLinesToggle

" Neoformat
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_java_clang = {
        \ 'exe': 'clang-format',
        \ 'stdin': 1,
        \ }
let g:neoformat_enabled_java = ['clang']

nnoremap <Leader>cf :Neoformat<CR>
vnoremap <Leader>cf :Neoformat<CR>
" format line +-1
autocmd FileType c,cpp,objc,java,javascript nnoremap <Leader>cc :.-1,.+1Neoformat<CR>


" markdown ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'vimwiki',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile content.txt set ft=fitnesse
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
    au BufReadPost,BufNewFile *.ASN set ft=asn
    au BufReadPost,BufNewFile *.gsh set ft=Jenkinsfile
    au BufReadPost,BufNewFile *.bbappend set ft=bash
    au BufReadPost,BufNewFile *.bbclass set ft=bash
    au BufReadPost,BufNewFile *.bb set ft=bash
    au BufReadPost,BufNewFile *.inc set ft=bash
augroup END


let g:syntastic_cpp_compiler_options = "-std=c++14"
let g:syntastic_java_checkers = []
" add constant
nmap <leader>cre /[,)]<CR>:nohlsearch<CR>Bhi&<ESC>?[,(]<CR>:nohlsearch<CR>wiconst <ESC>

noremap <leader>cr :pyf ~/bin/clang-rename.py<cr>

:nmap \e :NERDTreeToggle<CR>
":nmap \t w setlocal wrap!<CR>:setlocal wrap?
":command Wrap setlocal wrap!<CR>:setlocal wrap?
":command :wrapt setlocal wrap!<CR>:setlocal wrap?<CR> " change wrapping
command! E :e %:p:h
command! LS :!ls -alh --color=always %:p:h

"folding

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
nnoremap z<space> zA
set foldmethod=indent   " fold based on indent level


" Paste without yanking selected
xnoremap <leader>p "_dP
" Stamp = delete current word (without yanking) and paste
nnoremap S "_diwPb
nnoremap x "_x
nnoremap X "_X
xnoremap S "_diwPb
xnoremap x "_x
xnoremap X "_X


" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" move to beginning/end of line
nmap <Home> ^
nmap <End> $

nnoremap gV `[v`]  " This mapping allows you to reselect the text you just pasted:
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>  " goto midle of line

" diff merge
nnoremap <leader>d1 :diffget 1<CR>
nnoremap <leader>d2 :diffget 2<CR>
nnoremap <leader>d3 :diffget 3<CR>

command! Diffstart :windo diffthis
command! Diffstop :diffoff!

"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set tabpagemax=50 " max number of pages


"plugins
set runtimepath^=~/.nvim/bundle/ctrlp.vim


"save with root
command! Wroot :execute ':silent w !sudo tee % > /dev/null' | :edit!
" fix typo
command! W :w


"   YCMd
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/bin/rc/.ycm_extra_conf.py'
" let g:ycm_error_symbol = '%'
" let g:ycm_warning_symbol = '%'
" let g:ycm_always_populate_location_list = 1
" let g:ycm_max_diagnostics_to_display = 300
" nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>yg :YcmCompleter GoTo<CR>
" nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
" nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
" nnoremap <leader>yd :YcmCompleter GetDoc<CR>
" nnoremap <leader>yf :YcmCompleter FixIt<CR>
" nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>ys :YcmDiags<CR>
" nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>yR :YcmRestartServer<CR>
" nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
" nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
" "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" set completeopt+=menuone

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Disable diagnostics
" let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '%'}
" Disable highligh errors
let g:lsp_highlights_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': ','}
let g:lsp_diagnostics_signs_information = {'text': '.'}
let g:lsp_diagnostics_signs_hint = {'text': '.'}
let g:lsp_textprop_enabled = 0
let g:lsp_signs_priority = 11

" see ~/bin/rc/pycodestyle linked to ~/.config/pycodestyle
let g:lsp_settings = {
            \  'python': {'cmd': ['pyls','-v']}
            \}

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/.vim.asyncomplete.log')

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    " refer to doc to add more commands
endfunction

" Vim-async, youcompleteme, intelisense
nmap <F12> <plug>(lsp-declaration)
nmap gd <plug>(lsp-declaration)
nmap gD <plug>(lsp-definition)
nmap gp <plug>(lsp-peek-declaration)
nmap gP <plug>(lsp-peek-definition)
nmap ge <plug>(lsp-next-diagnostic)
nmap gh <plug>(lsp-hover)
nmap gr <plug>(lsp-references)
nmap gE <plug>(lsp-document-diagnostics)
nmap ga <plug>(lsp-code-action)
nmap <leader>ya <plug>(lsp-code-action)
nmap <leader>yj <plug>(lsp-declaration)
nmap <leader>yg <plug>(lsp-declaration)
nmap <leader>yd <plug>(lsp-peek-declaration)
nmap <leader>ys <plug>(lsp-status)

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))


set showtabline:0
" airline
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 79,
  \ 'x': 100,
  \ 'y': 90,
  \ 'z': 60,
  \ 'warning': 100,
  \ 'error': 80,
  \ }
let w:airline_skip_empty_sections = 1
" let g:airline_section_b=' %{fugitive#head()}'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z='%l/%L☰%c'
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#displayed_head_limit = 8
let g:airline#extensions#branch#displayed_head_limit = 8
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#lsp#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#searchcount#enabled = 0

" colorscheme themeinabox
let g:airline_theme='bubblegum'

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" autocmd VimEnter * set showtabline=0
" autocmd VimEnter * AirlineToggle

" tabline
" command! TablineON :let g:airline#extensions#tabline#enabled=1
" command! TablineOFF :let g:airline#extensions#tabline#enabled=0
" tabline
" command! TablineON :set showtabline=1
" command! TablineOFF :set showtabline=0

" statusline
command! StatuslineON :set laststatus=2
command! StatuslineOFF :set laststatus=1

" multicursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0


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

vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------------------------
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


" Python specific
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

command! Pandocahtml :w | ! pandocconvert.sh "%" html5
command! Pandocpdf :w | ! pandocconvert.sh "%" pdf
command! Pandocdocx :w | ! pandocconvert.sh "%" docx
command! Openahtml :w | ! pandocconvert.sh "%" html5 open
command! Openpdf :w | ! pandocconvert.sh "%" pdf open
command! Opendocx :w | ! pandocconvert.sh "%" docx open

" -----------------------------------------------------------------------------
" cn

let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
    nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" substitute for current selection
xnoremap gs y:%s/<C-r>"//g<Left><Left>


" -----------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------
" search for visually selected text
vnoremap // y/<C-R>"<CR>

" -----------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------
" select ag as :Ack search when available
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nnoremap <leader>ag "zyiw:Ag <C-r>z<CR>
nnoremap <leader>ack "zyiw:Ack <C-r>z<CR>

" -----------------------------------------------------------------------------
"  CtrlSF
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'cwd'
cnoreabbrev FS CtrlSF
cnoreabbrev Fs CtrlSF
nnoremap <leader>fs :CtrlSF<CR>

" -----------------------------------------------------------------------------
"Work stuff clear case
command! Ctpdiff :!cleartool diff -pre -col 190 % | less
command! Ctpdiff2 :!cleartool diff -pre -ser % | less


" -----------------------------------------------------------------------------
" Fix autocompletions
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

inoremap <silent><C-X><C-U> <C-R>=g:UltiSnips_Complete()<CR>

" -----------------------------------------------------------------------------
" execute macro on visal range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" -----------------------------------------------------------------------------
" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" -----------------------------------------------------------------------------
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
if has("nvim")
    call system('mkdir ~/..config/nvim/undodir')
    set undodir=~/.config/nvim/undodir
else
    call system('mkdir ~/.vim/undodir')
    set undodir=~/.vim/undodir
endif


" -----------------------------------------------------------------------------
" http://vim.wikia.com/wiki/Sum_numbers
" :let g:S=0
" :%s/\d\+/\=Sum(submatch(0))/
" :echo g:S
let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction

" -----------------------------------------------------------------------------
" CMake support
function! BuildCMakeProjectShort(target, dir)
    echom a:target
    if isdirectory(a:dir)
        silent !clear
        execute "! cd " . a:dir . " && clear && cmake --build . --target " . a:target . " -- -j" . (system('grep -c ^processor /proc/cpuinfo')+1) . " && echo '-- Build was OK'"
    else
        echo "build folder was not found, cannot build"
    endif
endfunction

function! BuildCMakeProject(target, dir)
    echom a:target
    let currentWinNr = winnr()
    " let wnr = bufwinnr('__Build_output__')

    echom g:build_window_height
    execute 'copen '. g:build_window_height
    " copen 25

    setlocal filetype=krcppbuild
    " Insert the bytecode.
    setlocal nonumber
    setlocal norelativenumber
    setlocal conceallevel=3
    :map <buffer> q :bd<cr>
    " setlocal nomodifiable

    execute 'AsyncRun '. a:target

    " go back
    exe l:currentWinNr  . "wincmd w"

endfunction

nmap <leader>bt :!tmux send-keys -t "build" Up Enter<CR><CR>

if isdirectory("build")
    nmap <leader>bb :call BuildCMakeProject("bb install", "build")<CR>
    nmap <leader>bi :call BuildCMakeProject("bb install", "build")<CR>
    nmap <leader>bbb :call BuildCMakeProject("bb unit", "build")<CR>
    nmap <leader>bu :call BuildCMakeProject("bb unit", "build")<CR>
    nmap <leader>buu :call BuildCMakeProject("bb unit", "build")<CR>
    nmap <leader>bc :call BuildCMakeProject("bb check", "build")<CR>
    nmap <leader>ba :call BuildCMakeProject("bb install", "build")<CR>
    nmap <leader>br :call BuildCMakeProjectShort("bb run", "build")<CR>
    nmap <leader>bC :call BuildCMakeProject("bb clean", "build")<CR>
    nmap <leader>bf :call BuildCMakeProject("bb format", "build")<CR>
    nmap <leader>be :call BuildCMakeProject("idf.py build && ./fixup.sh ", ".")<CR>
    nmap <leader>bE :call BuildCMakeProject("idf.py build && idf.py -p /dev/ttyUSB0 flash", ".")<CR>
endif

" Put this into your project_root/.vimrc.local
" nmap <leader>bgu :Termdebug ../build/source/unittest/unittests -cd test<CR>
nmap <F6> :Step<CR>
nmap <F7> :Over<CR>
nmap <F8> :Finish<CR>
nmap <F9> :Continue<CR>
nmap <leader>B :Break<CR>
nmap <leader>BB :Clear<CR>
nmap <F10> :Eval<CR>


" -----------------------------------------------------------------------------
" error message formats - see :help errorformat
let &efm = '\.\.\/%f:%l: FAILED:' . ','
let &efm .= '%f:%l: FAILED:' . ','
let &efm .= '\.\.\/%f:%l:%c: error: %m' . ','
let &efm .= '%f:%l:%c: error: %m' . ','
let &efm .= '\.\.\/%f:%l:%c: warning: %m' . ','
let &efm .= '%f:%l:%c: warning: %m' . ','
let &efm .= '\.\.\/%f:%l: error: %m' . ','
let &efm .= '%f:%l: error: %m' . ','
let &efm .= '\.\.\/%f:%l: warning: %m' . ','
let &efm .= '%f:%l: warning: %m' . ','


syntax sync minlines=256
