""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VIM, not VI
set nocompatible

" General appearance and behaviour
filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set linebreak
set listchars=eol:$,nbsp:%

" don't load modelines...
set nomodeline

" Search options
set incsearch
set hlsearch
set ignorecase

" Indentation options
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set virtualedit=block
set scrolloff=1

set equalprg=

" don't insert 2 spaces after punctuation
set nojoinspaces

" vimdiff
set diffopt=filler,iwhite

set spellcapcheck=

if match($TERM, '256color$') != -1
  colorscheme 256_xoria
endif

" This is useful for debugging
" set verbose=9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACEHI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup mostly_spacehi
  autocmd!
  autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
  autocmd FileType help     NoSpaceHi
  autocmd FileType diff     NoSpaceHi
  autocmd FileType man      NoSpaceHi
  autocmd FileType scratchy NoSpaceHi
  autocmd FileType go       NoSpaceHi
  autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax,BufWritePost *.go NoSpaceHi
  autocmd FileType make     NoSpaceHi
  autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax,BufWritePost Makefile NoSpaceHi
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use tmux for slime
let g:slime_target = "tmux"
"let g:slime_default_config = {"socket_name": "default", "target_pane": "3"}
let g:jsx_ext_required = 0

nmap <c-c><c-l> :SlimeSend0 ""<CR>
nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>

let g:slime_default_config = {"socket_name": "default", "target_pane": "%"}

let g:NERDCustomDelimiters = {
  \ 'zinc': { 'left': '%'},
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/mappings.vim
let g:syntastic_javascript_checkers = ['eslint']
