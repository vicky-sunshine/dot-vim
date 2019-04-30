" Maintainer: Chi-Hsuan Li
" GitHub: https://github.com/vicky-sunshine/dot-vim



set nocompatible             " not compatible with the old-fashion vi mode
set bs=2
set number
set ruler
set autoread
set updatetime=250
set nobackup                 " no *~ backup files
set ignorecase               " ignore case when searching
set incsearch                " incremental search
set directory=$HOME/.vimswp  " move .swp files to specific directory
set encoding=UTF-8

filetype on
filetype indent on
filetype plugin on



" === color theme (theme install in plugin)
set background=dark
set termguicolors
" ------ airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1 " enable powerline-fonts
set laststatus=2 " set status line
" ------ theme
colorscheme OceanicNext



" === Highlight
syntax on                    " syntax highlight
set hlsearch                 " search highlighting
set cursorline               " highlight current line
set cursorcolumn             " highlight current column
set colorcolumn=101
set t_Co=256
set showmode                 " Show current mode
set showmatch                " Cursor shows matching ) and }
" ------ line number color
highlight LineNr ctermfg=white
highlight CursorLineNr ctermfg=black ctermbg=white
" ------ GitGutter
highlight GitGutterAdd    ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red



" === Indent
set autoindent               " auto indentation
set smartindent              " smart indentation
set cindent                  " C-style indentation
set copyindent               " copy the previous indentation on autoindenting
set smartcase                " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab                 " insert tabs on the start of a line according to context
" ------ show tabs as "⇒····" and trail whitespace as "·"
set listchars=tab:⇛·,trail:· 
highlight SpecialKey ctermfg=grey
set list



" === copy shell cursor operation
nnoremap <C-A>      <Home>
nnoremap <C-E>      <End>
nnoremap <C-K>      <C-U>



" === NerdTree
" ------ close vim if the only window left open is a NERDTree
" ------ expand tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap tt :NERDTreeToggle<CR>



" === Go languange
  " use fatih/vim-go as an official plugin alternative
  au filetypedetect BufRead,BufNewFile *.go setfiletype go
  au FileType go call SetupGoSettings()
  function! SetupGoSettings()
    nmap gf :GoFmt<CR>
    nmap gi :GoImports<CR>
  endfunction
  let g:go_fmt_autosave = 1
  let g:go_fmt_command = "goimports"
  au BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" === Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " update self
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'EasyMotion'
Plugin 'AutoClose'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'
Plugin 'ryanoasis/vim-devicons'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on


