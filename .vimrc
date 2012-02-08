colorschem hemisu
set background=dark			" Set the background to dark
set nocompatible        " Use Vim defaults (much better!)                                    
set bs=indent,eol,start " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set number              " show line numbers
set smarttab            " smart tabulatin and backspace
set title               " show title
set incsearch           " find while typing
set t_Co=256            " terminal uses 256 colors
set noerrorbells        " don't make noise
set novisualbell        " don't blink
set cursorline          " highlight current line
set softtabstop=2       " when hitting tab how many spaces should a tab be.
set shiftwidth=2        " auto-indent tab size
set tabstop=2           " real tabs should be 8
set autochdir           " always switch to the current file directory
set ignorecase              " case insensitive patterns
set smartcase               " case insensitive patterns - when only lowercase is used
set pastetoggle=<F2>        " F2 toggles indenting when pasting
set wildmenu                " make command-line completion bash like + menu
set wildmode=longest:full   " sets wildmode, also invokes wildmenu (if enabled)

" Switch syntax highlighting on, when the terminal has colors             
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin indent on

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"


" Display a place holder character for tabs and trailing spaces
"set list
"set listchars=trail:⋅,nbsp:⋅,tab:▷⋅

" Set the leader key
let mapleader = ","                              

" Add what to ignore in the fuzzy search 
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif" 
let g:fuzzy_ignore = "*.ogg;*.OGG;*.ogv;*.OGV;*.mkv;*.MKV" 
let g:fuzzy_ignore = "*.mp3;*.mp3;*.mp4;*.MP4;*.avi;*.AVI;*.wma;*.WMA;*.wmv;*.WMV" 
let g:fuzzy_ignore = "*.flv;*.FLV;*.mov;*.MOV;*.pdf;*.PDF" 
let g:fuzzy_ignore = "*.zip;*.ZIP;*.tar;*.7z;*.gz;*.bz2" 
" Set the key to toggle buffersearch
map <leader>b :FufBuffer<cr>
map <leader>f :FufFile<cr>


" NERDtreeConfig
let NERDChristmasTree = 1               " NERDTree with colors
let NERDTreeHighlightCursorline = 1     " highlight cursorline
let NERDTreeMapActivateNode='<CR>'      " set Enter/Return to activate a node
" Set the key to toggle NERDTree
nnoremap <leader>d :NERDTreeToggle<cr>

" taglist config
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 35
" Set the key to toggle taglist
nnoremap <leader>t :TlistToggle<cr>

" Remove highlighting search results
map <silent> <leader>nh :nohls <cr>      

" Mapping for time good when you are in terminal fullscreen   
map <F2> :echo 'Current time is ' . strftime('%c')<cr>

