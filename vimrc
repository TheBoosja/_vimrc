
" ====  Master Boosja's _vimrc file  ====
" ===== http://www.github/theboosja =====


syntax enable

" ================== "
" ==== PLUGINS ===== "
" ================== "

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on


" ================== "
" ==== MAPPINGS ==== "
" ================== "

" Reload vimrc without quitting.
nnoremap <leader>rv :source $MYVIMRC<CR>

" CMD to _vimrc.
nnoremap <leader>av :tabnew $MYVIMRC<CR>


" Tab management
nnoremap <leader>tn :tabnew
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprev<CR>
nnoremap <leader>tl :tablast<CR>


inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i

inoremap ½ $
nnoremap ½ $



" ================== "
" ==== SETTINGS ==== "
" ================== "

" Show line numbers.
set number relativenumber


" Toggles line number mode between modes.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Show the ruler
set ruler


" Tabs
set tabstop=4 		" tab
set shiftwidth=4 	" indent

set smartindent


