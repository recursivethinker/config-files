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
set shiftwidth=2
set splitright splitbelow
set tabstop=2
set term=xterm-256color
set termguicolors
set textwidth=80
colorscheme habamax

" Set the filename at the bottom of the screen
set laststatus=2
" set statusline+=%F

filetype off
syntax on

map <leader>dd <ESC>:put=strftime('%Y-%m-%d %H:%M:%S')<CR>kJ$
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
Plug 'jamessan/vim-gnupg'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

call plug#end()


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" ...
call vundle#end()
filetype plugin indent on    " required
"
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
 Glaive codefmt plugin[mappings]
 Glaive codefmt google_java_executable="java -jar $HOME/.vim/formatter/google-java-format-1.17.0-all-deps.jar"


" Automatically enable Limelight when Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:vimwiki_list = [ 
			\ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},]

let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
" let g:markdown_folding = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
