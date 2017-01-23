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

" Keyboard mappings
nnoremap <leader>s :GitGutterStageHunk<cr>
nmap <silent> <leader>h :set hls!<cr>
nnoremap <silent> <Leader>z :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hls<CR>
