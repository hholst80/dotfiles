" {{{ Plug-ins

call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'svermeulen/vim-cutlass'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'

call plug#end()

" }}}
" {{{ Settings

if has('gui_running')
	set guiheadroom=0                        " Has no effect?
	set guioptions=agit
	set guifont=Latin\ Modern\ Mono\ 12
	set background=light
	colorscheme gruvbox
else
	if has('nvim')
		set termguicolors
	elseif &t_Co == 256 && &term =~# '^xterm'
		set termguicolors
	elseif &t_Co == 256 && &term =~# '^\(screen\|tmux\)'
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
	end
	set background=dark
	colorscheme gruvbox
end

set clipboard^=unnamed,unnamedplus
set foldlevelstart=0
set updatetime=100

set nojoinspaces
set nomodeline
set noshowmode
set nowrap

" {{{ ALE settings

set omnifunc=ale#completion#OmniFunc

" }}}

" }}}
" {{{ Plug-in configuration

" {{{ ALE configuration

let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['pylint']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_python_pylint_executable = 'pylint3'

" }}}
" {{{ Ack configuration

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" }}}
" {{{ Lightline configuration

if &t_Co != 8
	let g:lightline = {'colorscheme': g:colors_name}
endif

" }}}
" {{{ vim-gitgutter configuration

"let g:gitgutter_git_args = '--git-dir=/home/holst/.yadm/repo.git'
"let g:gitgutter_highlight_lines = 1
"set signcolumn=yes
"let g:gitgutter_log = 1

" }}}
" }}}
" {{{ Maps

nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>e :BufExplorer<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :confirm qall<CR>
nnoremap <leader>r :source $HOME/.vimrc<CR>
nnoremap <leader>s :w<CR>
if has('nvim')
	nnoremap <leader>t :terminal<CR>i
else
	nnoremap <leader>t :terminal ++curwin<CR>
endif

" {{{ ALE maps

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}

" }}}
" {{{ Autocommand groups

augroup yaml_indent
	au!
	au FileType yaml setlocal fdm=indent foldlevel=1 tabstop=2 shiftwidth=2
augroup END

augroup vimrc
	au!
	au FileType vim setlocal fdm=marker foldlevel=0
augroup END

augroup tmux
	au!
	au FileType tmux setlocal fdm=marker foldlevel=0
augroup END

augroup gitgutter
	au!
	"au FileType .* if expand("%:p:h") == "/home/holst" | let g:gitgutter_git_args = "--git-dir=/home/holst/.yadm/repo.git" | endif
	"au BufLeave * let g:gitgutter_git_args = ""
augroup END

" }}}
