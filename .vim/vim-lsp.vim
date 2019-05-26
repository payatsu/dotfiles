if executable('clangd')
autocmd User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd']},
		\ 'whitelist': ['cpp'],
		\ })
endif
