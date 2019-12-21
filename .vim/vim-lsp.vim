if executable('clangd')
autocmd User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd', '-background-index']},
		\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
		\ })
endif

if executable('rls')
autocmd User lsp_setup call lsp#register_server({
		\ 'name': 'rls',
		\ 'cmd': {server_info->['rls']},
		\ 'whitelist': ['rust'],
		\ })
autocmd FileType rust setlocal omnifunc=lsp#complete
endif

let g:lsp_use_event_queue = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
