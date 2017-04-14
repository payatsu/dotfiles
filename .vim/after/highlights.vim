if exists('w:my_highlights_already_loaded')
	finish
endif

highlight Grayout        ctermfg=Gray         ctermbg=NONE   cterm=NONE           guifg=Gray40      guibg=NONE   gui=NONE
highlight Caption        ctermfg=NONE         ctermbg=NONE   cterm=bold,underline guifg=NONE        guibg=NONE   gui=bold,underline
highlight Star           ctermfg=Yellow       ctermbg=NONE   cterm=bold           guifg=Yellow      guibg=NONE   gui=bold
highlight Circle         ctermfg=Red          ctermbg=NONE   cterm=bold           guifg=Red         guibg=NONE   gui=bold
highlight Square         ctermfg=LightMagenta ctermbg=NONE   cterm=bold           guifg=Violet      guibg=NONE   gui=bold
highlight Diamond        ctermfg=Green        ctermbg=NONE   cterm=bold           guifg=Green       guibg=NONE   gui=bold
highlight Triangle       ctermfg=DarkRed      ctermbg=NONE   cterm=bold           guifg=DarkRed     guibg=NONE   gui=bold
highlight DTriangle      ctermfg=LightBlue    ctermbg=NONE   cterm=bold           guifg=LightBlue   guibg=NONE   gui=bold
highlight EnclosedNumber ctermfg=Magenta      ctermbg=NONE   cterm=bold           guifg=DarkMagenta guibg=NONE   gui=bold
highlight Note           ctermfg=Gray         ctermbg=Yellow cterm=bold           guifg=Gray20      guibg=Orange gui=bold
highlight Red          ctermfg=Red         ctermbg=NONE guifg=Red        guibg=NONE
highlight Green        ctermfg=Green       ctermbg=NONE guifg=Green      guibg=NONE
highlight Blue         ctermfg=Blue        ctermbg=NONE guifg=DodgerBlue guibg=NONE
highlight Cyan         ctermfg=Cyan        ctermbg=NONE guifg=Cyan       guibg=NONE
highlight Magenta      ctermfg=Magenta     ctermbg=NONE guifg=Magenta    guibg=NONE
highlight Yellow       ctermfg=Yellow      ctermbg=NONE guifg=Yellow     guibg=NONE
highlight LightRed     ctermfg=LightRed    ctermbg=NONE guifg=HotPink    guibg=NONE
highlight LightGreen   ctermfg=LightGreen  ctermbg=NONE guifg=SeaGreen1  guibg=NONE
highlight LightBlue    ctermfg=LightBlue   ctermbg=NONE guifg=SkyBlue    guibg=NONE
highlight LightYellow  ctermfg=LightYellow ctermbg=NONE guifg=Orange     guibg=NONE
highlight RedR         ctermbg=Black ctermfg=Red         guibg=Black guifg=Red
highlight GreenR       ctermbg=Black ctermfg=Green       guibg=Black guifg=Green
highlight BlueR        ctermbg=Black ctermfg=Blue        guibg=Black guifg=DodgerBlue
highlight CyanR        ctermbg=Black ctermfg=Cyan        guibg=Black guifg=Cyan
highlight MagentaR     ctermbg=Black ctermfg=Magenta     guibg=Black guifg=Magenta
highlight YellowR      ctermbg=Black ctermfg=Yellow      guibg=Black guifg=Yellow
highlight LightRedR    ctermbg=Black ctermfg=LightRed    guibg=Black guifg=HotPink
highlight LightGreenR  ctermbg=Black ctermfg=LightGreen  guibg=Black guifg=SeaGreen1
highlight LightBlueR   ctermbg=Black ctermfg=LightBlue   guibg=Black guifg=SkyBlue
highlight LightYellowR ctermbg=Black ctermfg=LightYellow guibg=Black guifg=Orange

highlight link Hi01 Red
highlight link Hi02 Green
highlight link Hi03 Blue
highlight link Hi04 Cyan
highlight link Hi05 Magenta
highlight link Hi06 Yellow
highlight link Hi07 LightRed
highlight link Hi08 LightGreen
highlight link Hi09 LightBlue
highlight link Hi10 LightYellow

call matchadd('Grayout'       , '前記\|該')
call matchadd('Caption'       , '【[^】]*】\|『[^』]*』\|「[^」]*」\|＜[^＞]*＞\|〈[^〉]*〉\|《[^》]*》\|（[^）]*）\|｛[^｝]*｝\|［[^］]*］\|〔[^〕]*〕')
call matchadd('Star'          , '☆\|★')
call matchadd('Circle'        , '○\|●\|◎\|◯')
call matchadd('Square'        , '□\|■')
call matchadd('Diamond'       , '◇\|◆')
call matchadd('Triangle'      , '△\|▲')
call matchadd('DTriangle'     , '▽\|▼')
call matchadd('EnclosedNumber', '①\|②\|③\|④\|⑤\|⑥\|⑦\|⑧\|⑨')
call matchadd('Note'          , '※.*')

let w:my_highlights_already_loaded = 1
