" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'svermeulen/vim-cutlass'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

if has('gui')
	set guioptions-=m
	set guioptions-=T
	set guifont=Latin\ Modern\ Mono\ 12
	set clipboard^=unnamed,unnamedplus
	colorscheme gruvbox
end

set nomodeline
set termguicolors
set updatetime=100

nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :wall<CR>:quit<CR>
nnoremap <leader>r :source $HOME/.vimrc<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>t :terminal ++curwin<CR>

augroup yaml_indent
	au!
	au BufCreate yaml set fdm=indent tabstop=2 shiftwidth=2
augroup END
