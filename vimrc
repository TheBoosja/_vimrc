" =========================================== "
" ======[ Master Boosja's vimrc file ]======= "
" ====[ http://www.github.com/TheBoosja ]==== "
" =========================================== "

set foldmethod=marker

" ==[ PLUGINS  ]== {{{"

set nocompatible
filetype off

" --[ plugins ]-- {{{ "
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

" =====================================================
Plugin 'VundleVim/Vundle.vim'

" Color Schemes
Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/Wombat'

Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
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

nnoremap <leader>t :NERDTreeToggle<CR>


" }}}
" ==[ SETTINGS ]== {{{"

syntax enable
colorscheme wombat

if has('gui_running')
	set guioptions-=m  " no menubar
	set guioptions-=T  " no toolbar
	set guioptions-=r  " no right scrollbar
	set guioptions-=L  " no left scrollbar
	set guifont=Courier_New:h9:cANSI:qDRAFT
	set lines=75 columns=180 linespace=0
endif

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
augroup END

set autoread
set wildmenu

" Indentation
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

autocmd VimResized * wincmd =

" }}}
" ==[ MAPPINGS ]== {{{"

" Remap <leader>
let mapleader = "\<Space>"

nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>av :call OpenVimrc()<CR>
function! OpenVimrc()
	if line('$') == 1 && getline(1) == ''  " if not empty, new tab
		if &modified
			:edit! $MYVIMRC
		else
			:edit $MYVIMRC
		endif
	else
		:tabnew $MYVIMRC
	endif
endfunction

" System
nnoremap <leader>w :w<CR>|		" Write file
nnoremap <leader>q :x<CR>|		" Quit/SaveQuit file
nnoremap - :|					" Command Mode
nnoremap ½ $| 					" End of line
nnoremap <leader>c <C-W><C-W>|  " Cycle through windows

" Tabs
nnoremap <leader>n :tabnew
nnoremap <leader>x :tabclose<CR>
nnoremap <leader>h :tabfirst<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>k :tabprev<CR>
nnoremap <leader>l :tablast<CR>

inoremap {<CR> {<CR>}<Esc>O
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" }}}

