syn on
set et
set nu
set smartindent
set hlsearch
set ignorecase
set ts=2 sts=2 sw=2
set cursorline


set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}




" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" Vim에서 파일 탐색기를 사용할 수 있게 한다. - Nerd Tree
Plugin 'The-NERD-tree'

" Vim에서 자동완성 기능(Ctrl + P)을 키입력하지 않더라도 자동으로 나타나게 - AutoComplPop
"Plugin 'AutoComplPop'

" 열려있는 소스파일의 클래스, 함수, 변수 정보 창 - Tag List
Plugin 'taglist-plus'


" NERD Tree를 왼쪽에 생성
let NERDTreeWinPos = "left"

" NERD Tree는 F7키. Tag List는 F8키에 매칭.
nmap <F7> :NERDTree<CR>
nmap <F8> :TlistToggle<CR>

filetype on
" Tag list가 사용하는 ctags의 경로 설정
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0

" Tag list 창을 오른쪽으로 생성
let Tlist_Use_Right_Window = 1

" YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/jin_ycm.py"
