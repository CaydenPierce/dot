set showcmd
set number

" plugins with auto install.
if empty(glob('~/.vim/autoload/plug.vim'))
" silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/justinmk/vim-sneak'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/udalov/kotlin-vim'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" youcompleteme ycm setup for more than just current file
" let g:ycm_global_ycm_extra_conf = '.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"

" Initialize plugin system
call plug#end()

" remember more history
set history=1500

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
" let g:vimwiki_folding = 'list' " setup folding of lists

set signcolumn=no

" turn off YCM preview window shit
set completeopt-=preview

" tab completion
" set wildmode=longest,list,full
" #set wildmenu

" omnicomplete
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" faster escape
inoremap jk <c-c>`^

"insert timestamp
nmap <F3> i<C-R>=strftime("%Y_%m_%d_%H_%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y_%m_%d_%H_%M")<CR>

" Quickly insert an empty new line without entering insert mode
    nnoremap <Leader>o o<Esc>0"_D
    nnoremap <Leader>O O<Esc>0"_D

" syntastic - check for syntax errors
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*
"  
"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0
