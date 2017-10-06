" =========================================== "
" ======[ Master Boosja's vimrc file ]======= "
" ====[ http://www.github.com/TheBoosja ]==== "
" =========================================== "

set foldmethod=marker

" ==[ PLUGINS  ]== {{{"

if &compatible
	set nocompatible
endif
filetype off

" --[ plugins ]-- {{{ "
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

" =====================================================
Plugin 'VundleVim/Vundle.vim'

" Color Schemes
Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/Wombat'

" Syntax & Intellisence
Plugin 'w0rp/ale' 						" Linting
Plugin 'shawncplus/phpcomplete.vim'

Plugin 'tpope/vim-fugitive'				" Git
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'				" . repeat
Plugin 'tpope/vim-commentary'			" gcc
Plugin 'tpope/vim-speeddating'			" time <C-a> & <C-x>
Plugin 'itchyny/lightline.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'dhruvasagar/vim-table-mode'
" =====================================================

call vundle#end()
filetype plugin indent on
" }}}

set laststatus=2
set noshowmode

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'fugitive#head'
	\ },
	\ }

" nnoremap <leader>t :NERDTreeToggle<CR>


" }}}
" ==[ SETTINGS ]== {{{"
set noswapfile

set encoding=utf-8
if !exists("g:syntax_on")
	syntax enable
endif
colorscheme wombat

if has('gui_running')
	set guioptions-=m  " no menubar
	set guioptions-=T  " no toolbar
	set guioptions-=r  " no right scrollbar
	set guioptions-=L  " no left scrollbar
	set guifont=Courier_New:h9:cANSI:qDRAFT
	set lines=75 columns=200 linespace=1
endif

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
augroup END

" System
set wildmenu		" :autocomplete
set path+=**		" recursive path
set splitright		" split to right
set autoread		" on ext change, autoread file
set scrolloff=2		" scroll 5 lines from top/bottom
set cursorline		" show cursorline
set autochdir		" change working dir to curr file
set showbreak=\\\
set backspace=indent,eol,start 	" Allow deleting indent and line breaks
autocmd VimResized * wincmd =	" resizes splits on drag

" " Session
" set sessionoptions+=resize,winpos
" autocmd VimEnter * :source $HOME/vimfiles/session.vim
" autocmd VimLeave * :mksession! $HOME/vimfiles/session.vim

" ctags
nnoremap <leader>, <C-]><CR>

" Indentation
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" netrw
nnoremap <leader>o :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0

" 81st column
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 100)


" }}}
" ==[ MAPPINGS ]== {{{"

" Remap <leader>
let mapleader = "\<Space>"

nnoremap <leader>rv :write<CR>:source $MYVIMRC<CR>
nnoremap <leader>av :call OpenVimrc()<CR>
function! OpenVimrc() abort
	if line('$') == 1 && getline(1) == ''  " if not empty, new tab
		:edit $MYVIMRC
	else
		:vsplit $MYVIMRC
	endif
endfunction

" System
nnoremap <leader>w :write<CR>|		" Write file
nnoremap <leader>q :xit<CR>|		" Quit/SaveQuit file
nnoremap - :|						" Command Mode
nnoremap <leader>c <C-W><C-W>|  	" Cycle through windows

" Tabs
nnoremap <leader>n :tabnew
nnoremap <leader>x :tabclose<CR>
nnoremap <leader>h :tabfirst<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>k :tabprev<CR>
nnoremap <leader>l :tablast<CR>

" Braces & Quotes
inoremap {<CR> {<CR><BS>}<Esc>O
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap () ()
inoremap (<CR> (<CR><BS>)<Esc>O
inoremap [ []<Esc>i
inoremap [] []
inoremap [<CR> [<CR><BS>]<Esc>O
inoremap ' ''<Esc>i

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nnoremap , ;
nnoremap ; ,

" }}}

