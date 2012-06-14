so ~/.vim/vundle_setup.vim

" tabs and such
set nu " number lines
set ai " autoindent
set sts=4 " soft tabstop
set cin " c-indenting
set sw=4 " ai indent width
set ts=4 " normal tabstop
set et " convert tabs to spaces

if has("gui_running")
    " window size
    set lines=50
    set columns=150
endif

" pathogen plugin loading for all plugins in ~/.vim/bundle
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" autoindent thing (meant to be used with autoclose v1.2 with line 88 commented out)
inoremap {<CR> {<CR>}<Esc>O
nnoremap \) i(<Esc>hx
nnoremap \( i(<Esc>x
noremap \_ xi(<Esc>[p
nnoremap \] i[<Esc>hx
nnoremap \[ i[<Esc>x
noremap \- xi[<Esc>[p
nnoremap \} i{<Esc>hx
nnoremap \{ i{<Esc>x
noremap \0 xi{<Esc>[p
noremap \" xi"<Esc>[p
"noremap \' xi'<Esc>[p
inoremap ,) (<Esc>hxa
inoremap ,} {<Esc>hxa
inoremap ,] [<Esc>hxa

" remap arrow keys to buffer stuff - arrows will switch between windows, shift+arrow keys switch between buffers/tabs
noremap <up> :wincmd k<CR>
noremap <down> :wincmd j<CR>
noremap \j :wincmd j<CR>
noremap <right> :wincmd l<CR>
noremap <left> :wincmd h<CR>
noremap <S-right> :bnext<CR>
noremap <S-left> :bprevious<CR>
noremap <S-down> :tabprevious<CR>
noremap <S-up> :tabnext<CR>
" Alt (option) + arrow keys = toggle minibufexplorer and nerdtree
noremap <M-up> :CMiniBufExplorer<CR>
noremap <M-down> :MiniBufExplorer<CR>
noremap <M-left> :NERDTreeClose<CR>
noremap <M-right> :NERDTree<CR>

" Backups
set backup " keep a backup file
set writebackup " more of the same
set bdir=./.undobak,. " set the backup-directory
set bex=~ " set the backup-extension

" misc
"set ruler   " status line below handles this now                                             " show the cursor position, alt:noruler
set history=100     " set history size to 100
set autoread        " check file is changed externally and auto-reload
set title           " show filename in terminal titlebar
set ttyfast         " make responsive
set scrolloff=3     " Always keep three lines above or below the cursor
set nocompatible    " Keep vim from trying to be 100% vi compatible

" Use j and k to move down and up _logical_ lines instead of line-break lines
nnoremap j gj
nnoremap k gk

" Enable filetype plugin
filetype plugin on
filetype indent on

" wildmenu and tabcompletion stuff
set wildmenu        " Pretty command-line option matching
set wildmode=list:longest " Shell-style matching
set wildignore=*.bak,*.o,*.e,*~,*.pyc,*.exe
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class,.pyc

" Colors and Highlighting
"set t_Co=256 " turn on 256 color mode
set showmatch " highlight matching brace
colorscheme mydesertEx " use this color scheme
syntax on " syntax highlighing
set cursorline " turn on the cursor line

" Search
set hls         " highlight search result
set ic          " case insensitive
set smartcase   " smart case sensitivity in search
set incsearch   " incremental searching
set infercase   " more clever case search stuff

set backspace=indent,eol,start " not really sure
" map shortcut to open vimrc
noremap ,v :e ~/.vimrc<cr>

" Status line
set ls=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] "\ \ \ \ \ \ \ \ %{VimBuddy()}

" vim-latex stuff
set grepprg=grep\ =nH\ $* " show file and line number apparently
let g:tex_flavor='latex'

" bind noh to C-h
noremap <C-h> :noh<CR>

" set up spellcheck
set spl=en_ca
noremap <silent> \ss :setlocal spell!<CR>

" exhuberant ctags
command! Ctags Gentags
command! Gentags !/usr/local/bin/ctags -R .

" use already-open window for buffer if possible
set switchbuf=useopen

" :W remaps to :w because I sometimes do :W by accident. also Q, WQ, QA, and WQA
command! W w
command! Q q
command! WQ wq
command! WQA wqa
command! QA qa
command! Qa qa

" :reconf reloads vimrc because i do that sometimes
command! Reconf :so ~/.vimrc

" \ma opens makefile in current directory
noremap \ma :e Makefile<CR>

" ,sa runs current file as script
noremap ,sa :so %<CR>

" ,tl toggles taglist
noremap ,tl :Tlist<CR>

" NERDCommenter prefs
let NERDCompactSexyComs=1
let NERDSpaceDelims=1
let NERD_c_alt_style=1
" let NERD_cpp_alt_style=1
" let NERD_java_alt_style=1
noremap ,cc \cc
noremap ,ci \ci
noremap ,cs \cs
noremap ,cu \cu
noremap ,cm \cm

" automatically write file when switching buffers
set autowrite

" persistent undo
if v:version >= 703 && has("persistent_undo")
    set undofile
    set undodir=./.undobak
endif

" make undobak directory
command! Makeundobak !mkdir .undobak

" load abbreviations
so ~/.vim/abbr.vim

" open abbrevations file
command! Abbr e ~/.vim/abbr.vim

" swap files
set directory=./.undobak,.

" delete backup files in current directory
command! Delback !rm *~

" disable auto eol for last line
function! NOEOL()
	set noeol
	set binary
endfunction
command! NoEOL call NOEOL()

" local tags files
if isdirectory('./.undobak')
    let g:easytags_file = './.undobak/easytags'
else
    let g:easytags_file = '~/.vimtags'
endif

set tags=~/.vimtags,~/vimtags,./tags,./.tags,./.undobak/tags,./.undobak/.tags,./.undobak/easytags

" highlight end of line whitespace and use <leader><space> to delete it all
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

" map tab and shift-tab to go to next and previous function, respectively
nnoremap <silent> <Tab> ]]
nnoremap <silent> <S-Tab> [[

set virtualedit+=block " allow selecing after line end in visual block mode

" show quickfix window for current search with <leader>g:
nnoremap <silent> <leader>g :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" easier quickfix navigation
nnoremap Q :copen<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" ascii underlines
nnoremap ,u yypVr-
nnoremap ,U yypVr=

" highlight lines longer than 80 characters
function! HighlightLongLines()
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
endfunction
nnoremap <silent> ,ll :call HighlightLongLines()<CR>

" Find next line longer than 80 characters
nnoremap ,nll /\%81v.\+/<CR>

" jk escape
inoremap jk <Esc>
