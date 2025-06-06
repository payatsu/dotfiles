if executable('clangd')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'allowlist': ['c', 'cpp', 'cuda', 'objc', 'objcpp'],
        \ })
endif

if executable('rls')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'allowlist': ['rust'],
        \ })
endif

if executable('pylsp')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('gopls')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-remote=auto']},
        \ 'allowlist': ['go', 'gomod', 'gohtmltmpl', 'gotexttmpl'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    set foldmethod=expr
        \ foldexpr=lsp#ui#vim#folding#foldexpr()
        \ foldtext=lsp#ui#vim#folding#foldtext()
endfunction

augroup LspInstall
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 100
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 100
let g:lsp_diagnostics_highlights_delay = 100
let g:lsp_diagnostics_signs_delay = 100
let g:lsp_document_code_action_signs_delay = 100
let g:lsp_use_event_queue = 1
let g:lsp_document_highlight_delay = 200
let g:lsp_document_highlight_enabled = 1
let g:lsp_fold_enabled = 0
