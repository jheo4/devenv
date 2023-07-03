" cp init.vim ~/.config/nvim/init.vim
" cp coc-settings.json ~/.config/nvim/coc-settings.json
" CocInstall
"   coc-ccls clang
"   coc-rls  rust
"   coc-go   go
"   coc-java  java
"   coc-texlab latex
"   coc-python python

set nocompatible
set modeline
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set et
set nu
set smartindent
set autoindent
set ruler
set hlsearch
set incsearch
set ignorecase smartcase
set history=999
set undolevels=999
set mouse=a  "To use mouse wheel for scrolling floating description windows
set autoread
set nobackup
set showmatch
set showmode
set laststatus=2
set title
set foldmethod=indent

" z=: correct spell suggestions
"set spell spelllang=en_us
set copyindent

set tabstop=2
"set smarttab
set ts=2 sts=2 sw=2
"color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=lightgrey ctermbg=8
set background=dark


set guioptions=egmrLt
set linespace=1
set backspace=2

" Line Feed & Ruler for 80 characters
"set tw=79
"set tw=119
"set fo+=a
set colorcolumn=120
highlight ColorColumn ctermbg=7 guibg=lightgrey
autocmd BufWinEnter * match Error /\s\+$\|^\s*\n\+\%$/

syntax on
filetype plugin indent on
au FileType cpp        setl ts=2 sw=2 sts=2
au FileType c          setl ts=2 sw=2 sts=2
au FileType cs         setl ts=4 sw=4 sts=4
au FileType h          setl ts=2 sw=2 sts=2
au FileType java       setl ts=2 sw=2 sts=2
au FileType python     setl ts=4 sw=4 sts=4
au FileType pyx        setl ts=4 sw=4 sts=4
au FileType md         setl ts=2 sw=2 sts=2
au FileType make       setl ts=2 sw=2 sts=2 noet

au BufRead,BufNewFile *.pyx set filetype=cython
au Filetype cython     setl ts=2 sw=2 sts=2

" Custom Commands
command Clear %s/\s\+$//e
command File echo expand('%:p')
command! Ncd :cd %:p:h

"" coc.nvim configuration
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=3

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd :vsplit<CR><Plug>(coc-definition)[v:false]
nmap <silent> gy :vsplit<CR><Plug>(coc-type-definition)
nmap <silent> gi :vsplit<CR><Plug>(coc-implementation)
nmap <silent> gr :vsplit<CR><Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=col:\ %c
set statusline+=\ %F

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

set rtp+=~/.fzf
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" CSharp + Unity Setting
"  :OmniSharpInstall v1.34.2
Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
" Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
call plug#end()

let g:coc_global_extensions=['coc-rls', 'coc-go', 'coc-java', 'coc-texlab', 'coc-jedi', 'coc-vimtex']
let maplocalleader = "`"

" Programming Language Specifics
" https://github.com/neoclide/coc.nvim/wiki/Language-servers
" ./config/nvim/coc-settings.json

runtime! vim-include/*.vim
iabbr __email 993jin@gmail.com
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __branch system("git rev-parse --abbrev-ref HEAD")
iabbr <expr> __uuid system("uuidgen")

set guicursor=a:blinkwait40-blinkoff50-blinkon50
set guicursor+=i-ci:hor30-iCursor-blinkwait40-blinkoff50-blinkon50
