"###############################################################################
"#
"# __   _(_)_ __ ___  _ __ ___ 
"# \ \ / / | '_ ` _ \| '__/ __|
"#  \ V /| | | | | | | | | (__ 
"# (_)_/ |_|_| |_| |_|_|  \___|
"#
"###############################################################################                            

set spell spelllang=en_us
set background=dark
set nocompatible
set number relativenumber
set shiftwidth=4
set splitright splitbelow
set tabstop=4
set term=xterm-256color
set termguicolors
set textwidth=80

" Set the filename at the bottom of the screen
set laststatus=2
" set statusline+=%F

filetype plugin on
syntax on

map <leader>dd <ESC>:put=strftime('%c')<CR>kJ$
map <leader>bb <ESC>:b#<CR>
map <leader>sp <ESC>:set spell spelllang=en_us<CR>
map <leader>ns <ESC>:set nospell<CR>

" Goyo and limelight
map <leader>go <ESC>:Goyo<CR>
map <leader>ngo <ESC>:Goyo!<CR>

" Source vimrc quickly
map <leader>rr <ESC>:source ~/.vimrc<CR>

" Set directory to current buffer
map <leader>cd <ESC>:chdir %:h<CR>

" Make it easier to enter normal mode.
inoremap jj <ESC> """ jj is the new esc
inoremap jk <ESC> """ jk is the new esc

" fzf mappings
nnoremap <leader>ls :Buffers<CR>
nnoremap <leader>ld :FZF<CR>
" ripgrep
nnoremap <leader>ss :Rg 

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

call plug#end()

" Automatically enable Limelight when Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:vimwiki_list = [ 
			\ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
" let g:markdown_folding = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
