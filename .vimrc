set showcmd
set number

" plugins with auto install.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/justinmk/vim-sneak'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ycm-core/YouCompleteMe'

" Initialize plugin system
call plug#end()

" show existing tab with 4 spaces width
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" autocomment
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

vnoremap <silent> / :s/^/\/\//<cr>:noh<cr>
vnoremap <silent> -/ :s/^\/\///<cr>:noh<cr>

" fix the damn python non indenting comments thing
set nosmartindent
set cindent

" vimwiki stuff
set nocompatible
filetype plugin on
syntax on

set signcolumn=no

" turn off YCM preview window shit
set completeopt-=preview

" tab completion
set wildmode=longest,list,full
set wildmenu
