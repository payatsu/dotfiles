if executable('clangd')
autocmd User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd', '-background-index']},
		\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
		\ })
endif
