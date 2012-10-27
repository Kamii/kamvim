set nocompatible        " Use Vim defaults (much better!)
set encoding=utf-8      " Always use utf-8
set fileencoding=utf-8  " Same here
set bs=indent,eol,start " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set number              " show line numbers
set title               " show title
set incsearch           " find while typing
set t_Co=256            " terminal uses 256 colors
set noerrorbells        " don't make noise
set novisualbell        " don't blink
set cursorline          " highlight current line
set autochdir           " always switch to the current file directory
set ignorecase          " case insensitive patterns
set smartcase           " case insensitive patterns - when only lowercase is used
set pastetoggle=<F2>    " F2 toggles indenting when pasting
set wildmenu            " make command-line completion bash like + menu
set wildmode=longest:full   " sets wildmode, also invokes wildmenu (if enabled)
colorschem wombat256

" Disabling default keys to learn hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Config for tagbar
nmap <F5> :TagbarToggle<CR>
let g:tagbar_width = 35

" Adding commands for shift q and w
command! -nargs=* -complete=file Q q <args>
command! -nargs=* -complete=file W w <args>
command! -nargs=* -complete=file Wq wq <args>
command! -nargs=* -complete=file WQ wq <args>

" Easy split navigation
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-K> <C-W>k
noremap <C-J> <C-W>j

" Switch syntax highlighting on, when the terminal has colors             
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Indent settings
" If you prefer to work with tab characters then it is a good idea to ensure that tabstop == softtabstop.
" If you prefer to work with spaces, then it is preferable to ensure that softtabstop == shiftwidth.
filetype plugin indent on
set softtabstop=8       " when hitting tab how many spaces should a tab be.
set shiftwidth=4       " auto-indent tab size
set tabstop=4           " real tabs should be 8"""
set expandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"


" Display a place holder character for tabs and trailing spaces
nmap <leader>l :set list!<CR>
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅,eol:¬

" Set the leader key
let mapleader = ","

" NERDtreeConfig
let NERDChristmasTree = 1               " NERDTree with colors
let NERDTreeHighlightCursorline = 1     " highlight cursorline
let NERDTreeMapActivateNode='<CR>'      " set Enter/Return to activate a node
" Set the key to toggle NERDTree
nnoremap <leader>d :NERDTreeToggle<cr>

" Remove highlighting search results
map <silent> <leader>nh :nohls <cr>      

" Mapping for time good when you are in terminal fullscreen   
map <F1> :echo 'Current time is ' . strftime('%c')<cr>

" pathogen config
call pathogen#infect()
call pathogen#helptags()

"Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
