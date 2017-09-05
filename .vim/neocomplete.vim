let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
