if !exists('g:include_set_startify_loaded')
    let g:include_set_startify_loaded = 1

    nmap <LocalLeader>s :Startify<CR>
    nmap <LocalLeader>ss :SSave<CR>

    " let g:startify_custom_header = ['']
    let g:startify_update_oldfiles = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_session_sort = 1
    let g:startify_session_persistence = 1
    "let g:startify_lists = [
    "      \ { 'type': 'sessions', 'header': ['   Sessions'], 'indices': range(0, 9) },
    "      \ { 'type': 'files', 'header': ['   MRU'], 'indices': range(10, 19) },
    "      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'], 'indices': range(20, 29) },
    "      \ ]
    let g:startify_commands = [
                \ ':help startify',
                \ ]

    let g:startify_list_order = [
                \ ['    Sessions'],
                \'sessions',
                \ ['    Most Recently Used files'],
                \'files',
                \'bookmarks',
                \ ['    Commands'],
                \'commands'
                \]
endif
