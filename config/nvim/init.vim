" 1) Install neovim following the instructions here:
"
" https://github.com/neovim/neovim/wiki/Installing-Neovim
"
" 2) Install vim-plug package manager:
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 3) Install required Python packages:
"
" pip install --upgrade neovim jedi

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/jpythonfold.vim'

Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/klen/python-mode'

" statusbar
Plug 'vim-airline/vim-airline'
" Plug 'aim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" let g:python_host_prog = '/home/hholst/anaconda3/envs/tensorflow/bin/python3'
" let g:python3_host_prog = '/home/hholst/anaconda3/envs/tensorflow/bin/python3'

let g:deoplete#enable_at_startup = 1

let g:jedi#show_call_signatures = 2
autocmd FileType python setlocal completeopt-=preview

" let g:SimpylFold_docstring_preview = 1
" let g:SimpylFold_fold_docstring = 1
" let g:SimpylFold_fold_import = 0

set termguicolors
set background=dark
" colorscheme gruvbox
colorscheme base16-chalk

" Vim backport
set clipboard^=unnamed,unnamedplus      " http://bit.ly/1XzQyju
set lazyredraw                          " Speed up redrawing.
set cursorline
set number
set list
set scrolloff=10
set virtualedit=block

" ===============
" Pymode settings
" ===============

let g:pymode_rope = 0
let g:pymode_syntax = 0
let g:pymode_lint_write = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
set completeopt-=preview

autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal textwidth=79

" Keyboard mappings

nmap <silent> <leader>h :set hls!<cr>
nnoremap <silent> <Leader>z :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hls<CR>
nnoremap <silent> <F10> :qall<CR>
nnoremap Y y$
