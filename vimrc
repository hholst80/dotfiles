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

if has('python3') && has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-jedi'
endif
Plug 'kien/ctrlp.vim'
" Plug 'vim-syntastic/syntastic'

let g:syntastic_ignore_files = ['\.py$']

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
Plug 'cjrh/vim-conda'
Plug 'majutsushi/tagbar'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'romainl/Apprentice'
Plug 'ciaranm/inkpot'
Plug 'vim-scripts/xterm16.vim'
Plug 'flazz/vim-colorschemes'

" Plug 'vim-scripts/jpythonfold.vim'

" Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'

Plug 'scrooloose/nerdtree'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc

" Plug 'shinokada/dragvisuals.vim'
" vmap  <expr>  <LEFT>   DVB_Drag('left')
" vmap  <expr>  <RIGHT>  DVB_Drag('right')
" vmap  <expr>  <DOWN>   DVB_Drag('down')
" vmap  <expr>  <UP>     DVB_Drag('up')
" vmap  <expr>  D        DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
" let g:DVB_TrimWS = 1

" Initialize plugin system
call plug#end()

" let g:python_host_prog = '/home/hholst/anaconda3/envs/tensorflow/bin/python3'
" let g:python3_host_prog = '/home/hholst/anaconda3/envs/tensorflow/bin/python3'

let g:deoplete#enable_at_startup = 1
let g:jedi#show_call_signatures = 2
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" let g:pymode_lint_checkers = ['pyflakes', 'mccabe']
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_lint_ignore = "W0611"

autocmd FileType python setlocal completeopt-=preview

" let g:SimpylFold_docstring_preview = 1
" let g:SimpylFold_fold_docstring = 1
" let g:SimpylFold_fold_import = 0

if has('nvim')
	set termguicolors
endif

set background=dark
" colorscheme gruvbox
" colorscheme base16-chalk
" colorscheme solarized8_dark
" colorscheme base16-atelier-sulphurpool
colorscheme apprentice

" Vim backport
set clipboard^=unnamed,unnamedplus      " http://bit.ly/1XzQyju
set lazyredraw                          " Speed up redrawing.
set cursorline
set number
set nolist
set scrolloff=10
set virtualedit=block

if has('gui')
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
	set guioptions-=T | set guioptions-=m
endif

" ===============
" Pymode settings
" ===============

let g:pymode_rope = 0
let g:pymode_syntax = 0
let g:pymode_lint_write = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_python = 'python3'
set completeopt-=preview

autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal textwidth=79

" Keyboard mappings

nmap <F8> :TagbarToggle<CR>

nmap <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>
vmap <C-s> <Esc>:w<CR>gv

nmap <silent> <leader>h :set hls!<cr>
nnoremap <silent> <Leader>z :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hls<CR>
nnoremap <M-q> :qall<CR>
nnoremap <silent> <F10> :qall<CR>
nnoremap Y y$

if filereadable("/home/hholst/src/a3c-batch/.vimrc")
	source /home/hholst/src/a3c-batch/.vimrc
endif

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" NEDTree configuration

nnoremap <C-N> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
