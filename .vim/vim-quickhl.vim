nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)

let g:quickhl_manual_colors = [
    \ "cterm=bold ctermfg=16 ctermbg=153 gui=bold guifg=#ffffff guibg=#ff3333",
    \ "cterm=bold ctermfg=7  ctermbg=1   gui=bold guifg=#ffffff guibg=#33ff33",
    \ "cterm=bold ctermfg=7  ctermbg=2   gui=bold guifg=#ffffff guibg=#3333ff",
    \ "cterm=bold ctermfg=7  ctermbg=3   gui=bold guifg=#333333 guibg=#ffff33",
    \ "cterm=bold ctermfg=7  ctermbg=4   gui=bold guifg=#333333 guibg=#33ffff",
    \ "cterm=bold ctermfg=7  ctermbg=5   gui=bold guifg=#333333 guibg=#ff33ff",
    \ "cterm=bold ctermfg=7  ctermbg=6   gui=bold guifg=#ffffff guibg=#cc9900",
    \ "cterm=bold ctermfg=7  ctermbg=21  gui=bold guifg=#ffffff guibg=#00cc99",
    \ "cterm=bold ctermfg=7  ctermbg=22  gui=bold guifg=#ffffff guibg=#9900cc",
    \ "cterm=bold ctermfg=7  ctermbg=45  gui=bold guifg=#ffffff guibg=#cc0099",
    \ "cterm=bold ctermfg=7  ctermbg=16  gui=bold guifg=#ffffff guibg=#99cc00",
    \ "cterm=bold ctermfg=7  ctermbg=50  gui=bold guifg=#ffffff guibg=#0099cc",
    \ "cterm=bold ctermfg=7  ctermbg=56  gui=bold guifg=#333333 guibg=#ffcc00",
    \ "cterm=bold ctermfg=7  ctermbg=56  gui=bold guifg=#333333 guibg=#00ffcc",
    \ "cterm=bold ctermfg=7  ctermbg=56  gui=bold guifg=#333333 guibg=#cc00ff",
    \ ]
