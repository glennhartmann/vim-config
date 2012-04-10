set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:

" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'DrawIt'
Bundle 'easytags.vim'
Bundle 'extradite.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'minibufexpl.vim'
Bundle 'AutoClose'
Bundle 'SearchComplete'
Bundle 'vimbuddy.vim'
Bundle 'ZenCoding.vim'
Bundle 'speeddating.vim'
Bundle 'Syntastic'
Bundle 'Tabular'
Bundle 'taglist.vim'
Bundle 'vcscommand.vim'
Bundle 'Indent-Guides'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'unimpaired.vim'
Bundle 'cocoa.vim'
Bundle 'Command-T'
Bundle 'fugitive.vim'
Bundle 'Conque-Shell'
" Bundle 'clang-complete'
Bundle 'matchit.zip'
" Bundle 'SQLComplete.vim'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
