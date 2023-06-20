if !exists('g:include_set_vimwiki_loaded')
    let g:include_set_vimwiki_loaded = 1
    let g:vim_wiki_set_path = expand('<sfile>:p:h')
    let g:vimwiki_list = [
        \{
        \   'path': '~/github/wiki',
        \   'ext' : '.md',
        \   'diary_rel_path': '.',
        \},
    \]
    let g:vimwiki_conceallevel = 0
    let g:vimwiki_table_mappings = 0

    command! WikiIndex :VimwikiIndex
    nmap <LocalLeader>wi <Plug>VimwikiIndex
    nmap <LocalLeader>wti <Plug>VimwikiTabIndex
    nmap <LocalLeader>wrn <Plug>VimwikiRenameLink
    nmap <LocalLeader>wt :VimwikiTable<CR>
    nmap <LocalLeader>di <Plug>VimwikiDiaryIndex
    nmap <LocalLeader>mdi <Plug>VimwikiMakeDiaryNote
    nmap <LocalLeader>dt <Plug>VimwikiTabMakeDiaryNote
    nmap <LocalLeader>dy <Plug>VimwikiMakeYesterdayDiaryNote
    nmap <LocalLeader>ws <Plug>VimwikiUISelect
    nmap <LocalLeader>wh <Plug>Vimwiki2HTML
    nmap <LocalLeader>whh <Plug>Vimwiki2HTMLBrowse

    nmap <Tab>d 0f]lli__date<Space><esc>

    " If buffer modified, update any 'Last modified: ' in the first 20 lines.
    " 'Last modified: ' can have up to 10 characters before (they are retained).
    " Restores cursor and window position using save_cursor variable.
    function! LastModified()
        if g:md_modify_disabled
            return
        endif
        if &modified
            " echo('markdown updated time modified')
            let save_cursor = getpos(".")
            let n = min([10, line("$")])

            exe 'keepjumps 1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
                        \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
            call histdel('search', -1)
            call setpos('.', save_cursor)
        endif
    endfun
    function! NewTemplate()
        let l:wiki_directory = v:false

        for wiki in g:vimwiki_list
            if expand('%:p:h') == expand(wiki.path)
                let l:wiki_directory = v:true
                break
            endif
        endfor

        if !l:wiki_directory
            return
        endif

        if line("$") > 1
            return
        endif

        let l:template = []
        call add(l:template, '---')
        call add(l:template, 'layout  : wiki')
        call add(l:template, 'title   : ')
        call add(l:template, 'summary : ')
        call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
        call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
        call add(l:template, 'tag     : ')
        call add(l:template, 'toc     : true')
        call add(l:template, 'public  : true')
        call add(l:template, 'parent  : ')
        call add(l:template, 'latex   : false')
        call add(l:template, '---')
        call add(l:template, '')
        call setline(1, l:template)
        execute 'normal! G'
        execute 'normal! $'

        echom 'new wiki page has created'
    endfunction
    function! AddTemplate()
        let l:template = []
        call add(l:template, '---')
        call add(l:template, 'layout  : wiki')
        call add(l:template, 'title   : ')
        call add(l:template, 'summary : ')
        call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
        call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
        call add(l:template, 'tag     : ')
        call add(l:template, 'toc     : true')
        call add(l:template, 'public  : true')
        call add(l:template, 'parent  : ')
        call add(l:template, 'latex   : false')
        call add(l:template, '---')
        call add(l:template, '')
        call setline(1, l:template)
        execute 'normal! G'
        execute 'normal! $'

        echom 'new wiki page has created'
    endfunction

    function! AddPostTemplate()
        let l:template = []
        call add(l:template, '---')
        call add(l:template, 'layout: post')
        call add(l:template, 'title: ""')
        call add(l:template, 'date: ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
        call add(l:template, '---')
        call add(l:template, '')
        call setline(1, l:template)
        execute 'normal! G'
        execute 'normal! $'

        echom 'new wiki page has created'
    endfunction



    augroup vimwikiauto
        autocmd FileType vimwiki nnoremap <LocalLeader>f :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
        "autocmd FileType vimwiki nnoremap <F3> :VWS /
        "autocmd FileType vimwiki nnoremap <S-F3> :execute "VWB" <Bar> :lopen<CR>
        autocmd BufWritePre *.md keepjumps call LastModified()
        autocmd BufRead,BufNewFile *.md call NewTemplate()
        autocmd FileType vimwiki inoremap <S-Right> <C-r>=vimwiki#tbl#kbd_tab()<CR>
        autocmd FileType vimwiki inoremap <S-Left> <Left><C-r>=vimwiki#tbl#kbd_shift_tab()<CR>
        autocmd FileType vimwiki nnoremap <Space>w :w<CR>:call RefreshTagbar()<CR>
        autocmd VimLeavePre *.md call CloseTagbar()
    augroup END

    function! RefreshTagbar()
         let l:is_tagbar_open = bufwinnr('__Tagbar__') != -1
         if l:is_tagbar_open
             edit
         endif
    endfunction

    function! UpdateBookProgress()
        let l:cmd = g:vim_wiki_set_path . "/bookProgressUpdate.sh " . expand('%:p')
        call system(l:cmd)
        edit
    endfunction

    function! CloseTagbar()
        TagbarClose
    endfunction

    augroup todoauto
        autocmd BufWritePost *wiki/book.md call UpdateBookProgress()
    augroup END

    let g:md_modify_disabled = 0
    command! WikiTemplate :call AddTemplate()
    command! PostTemplate :call AddPostTemplate()
endif
