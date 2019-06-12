" {{{ Plug-ins

call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
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
	set guioptions-=m
	set guioptions-=T
	set guifont=Latin\ Modern\ Mono\ 12
	set clipboard^=unnamed,unnamedplus
	colorscheme gruvbox
else
	if has('nvim')
		set termguicolors
	end
	set background=dark
	colorscheme gruvbox
end

set foldlevelstart=0
set updatetime=100

set nomodeline
set noshowmode

" }}}
" {{{ Ack configuration

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" }}}
" {{{ Lightline configuration

let g:lightline = {
	\ 'colorscheme': g:colors_name,
	\ }

" }}}
" {{{ Maps

nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :confirm qall<CR>
nnoremap <leader>r :source $HOME/.vimrc<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>t :terminal ++curwin<CR>

" }}}
" {{{ Autocommand groups

augroup yaml_indent
	au!
	au FileType yaml setlocal fdm=indent tabstop=2 shiftwidth=2
augroup END

augroup vimrc
	au!
	au FileType vim setlocal fdm=marker foldlevel=0
augroup END

augroup tmux
	au!
	au FileType tmux setlocal fdm=marker foldlevel=0
augroup END

" }}}
