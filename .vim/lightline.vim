try
	let g:lightline = {
		\ 'colorscheme': 'wombat',
		\ 'active': {
			\ 'left': [['mode', 'paste'], ['attribute', 'filename']],
			\ 'right': [['lineinfo'], ['percent']]
			\ },
		\ 'inactive': {
			\ 'left': [['attribute', 'filename']]
			\ },
		\ 'separator': {'left': '', 'right': ''},
		\ 'subseparator': {'left': '', 'right': ''},
		\ 'component_function': {
			\ 'attribute': 'LightlineAttribute',
			\ 'filename': 'LightlineFilename',
			\ 'mode': 'LightlineMode'
			\ }
		\ }
	function! LightlineAttribute()
		return '[' . printf("%2d", bufnr('%')) . ':' . LightlineReadonly() . LightlineModified() . '][' . LightlineFileencoding() . LightlineBomb() . '|' . LightlineFileformat() . '][' . LightlineFiletype() . ']'
	endfunction
	function! LightlineModified()
		return &filetype =~ 'help' ? '' : &modified ? '+' : &modifiable ? ' ' : '-'
	endfunction
	function! LightlineReadonly()
		return &filetype !~? 'help' && &readonly ? 'RO' : '  '
	endfunction
	function! LightlineFilename()
		return '' != expand('%:t') ? expand('%:t') : '[No Name]'
	endfunction
	function! LightlineFileformat()
		return 70 < winwidth(0) ? &fileformat : ''
	endfunction
	function! LightlineFiletype()
		return 70 < winwidth(0) ? &filetype == '' ? '   ' : &filetype : ''
	endfunction
	function! LightlineFileencoding()
		return 70 < winwidth(0) ? &fileencoding == '' ? '   ' : &fileencoding : ''
	endfunction
	function! LightlineBomb()
		return &bomb ? '(BOM)' : ''
	endfunction
	function! LightlineMode()
		return 60 < winwidth(0) ? lightline#mode() : ''
	endfunction
	set noshowmode
catch /E117.*/
endtry
