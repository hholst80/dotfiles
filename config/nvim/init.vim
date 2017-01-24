" required packages:
" pip install --upgrade neovim jedi

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'morhetz/gruvbox'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/jpythonfold.vim'

Plug 'tpope/vim-unimpaired'

Plug 'https://github.com/klen/python-mode'

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
colorscheme gruvbox

" Vim backport
set clipboard^=unnamed,unnamedplus      " http://bit.ly/1XzQyju
set lazyredraw                          " Speed up redrawing.
set background=dark

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

" Keyboard mappings
nmap <silent> <leader>h :set hls!<cr>
nnoremap <silent> <Leader>z :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hls<CR>
nnoremap <silent> <F10> :qall<CR>
