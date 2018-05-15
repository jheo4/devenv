set nocompatible
set modeline
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
setlocal spelllang=en_us
syn on
set et
set nu
set smartindent
set cindent
set autoindent
set ruler 
set hlsearch
set ignorecase
set ts=2 sts=2 sw=2
set cursorline
set background=dark
set mouse=a

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'The-NERD-tree'
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=1
nmap <F7> :NERDTree<CR>

Plugin 'AutoComplPop'

Plugin 'kien/ctrlp.vim' "Super searching by Ctrl P 
Plugin 'vim-syntastic/syntastic'
let python_highlight_all = 1
syn on 

Plugin 'tpope/vim-fugitive' "basic vim command
Plugin 'taglist-plus' "source class, variables, tags
nmap <F8> :TlistsToggle<CR>
filetype on
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
call vundle#end()

"Clang auto completetion Ctrl P
Bundle 'Rip-Rip/clang_complete'
let g:clang_library_path = "/usr/lib"
let g:clang_library_file = "libclang.so.1"
let g:clang_use_library = 1
let b:clang_user_options = '-std=c++11'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
let g:clang_complete_auto = 1

Bundle 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-Space>"

Plugin 'jmcantrell/vim-virtualenv'

