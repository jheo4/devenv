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
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" directory explore
Bundle 'The-NERD-tree'
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=1
"let NERDIgnore['\.pyc$', '\~$']
nmap <F7> :NERDTree<CR>

" auto complete popup
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

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
""To avoid conflict snippets
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>

Bundle 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-Space>"

Plugin 'jmcantrell/vim-virtualenv'

