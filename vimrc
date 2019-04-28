set nocompatible   " not compatible with the old-fashion vi mode
set bs=2
set number
set ruler
set autoread

filetype on
filetype indent on
filetype plugin on

syntax on             " syntax highlight
set hlsearch          " search highlighting
set cursorline        " highlight current line
set cursorcolumn      " highlight current column
set colorcolumn=81
set t_Co=256
set showmode          " Show current mode
set showmatch         " Cursor shows matching ) and }

set nobackup                 " no *~ backup files
set ignorecase               " ignore case when searching
set incsearch                " incremental search
set directory=$HOME/.vimswp  " move .swp files to specific directory

" --- Indent
set autoindent               " auto indentation
set smartindent              " smart indentation
set cindent                  " C-style indentation
set copyindent               " copy the previous indentation on autoindenting
set smartcase                " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab                 " insert tabs on the start of a line according to context

" ------ show tabs as "⇒····"
set listchars=tab:⇛·,trail:·
set list

" --- copy shell cursor operation"
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" --- NerdTree
" ------ close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ------ expand tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap tt :NERDTreeToggle<CR>


" --- Go programming settings {
  " use fatih/vim-go as an official plugin alternative
  au filetypedetect BufRead,BufNewFile *.go setfiletype go
  au FileType go call SetupGoSettings()
  function! SetupGoSettings()
    nmap gf :GoFmt<CR>
    nmap gi :GoImports<CR>
  endfunction
  let g:go_fmt_autosave = 1
  let g:go_fmt_command = "goimports"


" --- Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'  " update self
Plugin 'mhartington/oceanic-next'  " color theme
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'EasyMotion'
Plugin 'AutoClose'
Plugin 'scrooloose/nerdtree'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on

