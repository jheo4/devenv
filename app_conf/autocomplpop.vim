" Append this script to the end of the acp.vim
" ~/.vim/bundle/AutoComplPop/plugin/acp.vim

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col-1]!~'\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-P>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <expr> <CR> pumvisible() ? "<C-Y><CR>" : "<CR>"
