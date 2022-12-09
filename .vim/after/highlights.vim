if exists('w:my_highlights_already_loaded')
	finish
endif

highlight Todo term=standout cterm=bold ctermfg=Gray ctermbg=Yellow gui=bold guifg=Gray30 guibg=Yellow

highlight Grayout        ctermfg=Gray         ctermbg=NONE   cterm=NONE           guifg=Gray40      guibg=NONE   gui=NONE
highlight Caption        ctermfg=NONE         ctermbg=NONE   cterm=bold,underline guifg=NONE        guibg=NONE   gui=bold,underline
highlight Star           ctermfg=Yellow       ctermbg=NONE   cterm=bold           guifg=Yellow      guibg=NONE   gui=bold
highlight Circle         ctermfg=Cyan         ctermbg=NONE   cterm=bold           guifg=Cyan        guibg=NONE   gui=bold
highlight Square         ctermfg=Red          ctermbg=NONE   cterm=bold           guifg=Red         guibg=NONE   gui=bold
highlight Diamond        ctermfg=Blue         ctermbg=NONE   cterm=bold           guifg=Blue        guibg=NONE   gui=bold
highlight Triangle       ctermfg=Green        ctermbg=NONE   cterm=bold           guifg=Green       guibg=NONE   gui=bold
highlight DTriangle      ctermfg=Red          ctermbg=NONE   cterm=bold           guifg=Red         guibg=NONE   gui=bold
highlight EnclosedNumber ctermfg=Magenta      ctermbg=NONE   cterm=bold           guifg=DarkMagenta guibg=NONE   gui=bold
highlight Attention      ctermfg=Black        ctermbg=Red    cterm=NONE           guifg=Black       guibg=Red    gui=bold
highlight AttentionStr   ctermfg=Red          ctermbg=NONE   cterm=bold,underline guifg=Red         guibg=NONE   gui=bold,underline
highlight Note           ctermfg=Gray         ctermbg=Yellow cterm=bold           guifg=Gray20      guibg=Orange gui=bold
highlight NoteStr        ctermfg=Yellow       ctermbg=NONE   cterm=bold,underline guifg=Orange      guibg=NONE   gui=bold,underline
highlight Red          ctermfg=Red         ctermbg=NONE        guifg=Red        guibg=NONE
highlight Green        ctermfg=Green       ctermbg=NONE        guifg=Green      guibg=NONE
highlight Blue         ctermfg=Blue        ctermbg=NONE        guifg=DodgerBlue guibg=NONE
highlight Cyan         ctermfg=Cyan        ctermbg=NONE        guifg=Cyan       guibg=NONE
highlight Magenta      ctermfg=Magenta     ctermbg=NONE        guifg=Magenta    guibg=NONE
highlight Yellow       ctermfg=Yellow      ctermbg=NONE        guifg=Yellow     guibg=NONE
highlight LightRed     ctermfg=LightRed    ctermbg=NONE        guifg=HotPink    guibg=NONE
highlight LightGreen   ctermfg=LightGreen  ctermbg=NONE        guifg=SeaGreen1  guibg=NONE
highlight LightBlue    ctermfg=LightBlue   ctermbg=NONE        guifg=SkyBlue    guibg=NONE
highlight LightYellow  ctermfg=LightYellow ctermbg=NONE        guifg=Orange     guibg=NONE
highlight RedR         ctermfg=Black       ctermbg=Red         guifg=Black      guibg=Red
highlight GreenR       ctermfg=Black       ctermbg=Green       guifg=Black      guibg=Green
highlight BlueR        ctermfg=Black       ctermbg=Blue        guifg=Black      guibg=DodgerBlue
highlight CyanR        ctermfg=Black       ctermbg=Cyan        guifg=Black      guibg=Cyan
highlight MagentaR     ctermfg=Black       ctermbg=Magenta     guifg=Black      guibg=Magenta
highlight YellowR      ctermfg=Black       ctermbg=Yellow      guifg=Black      guibg=Yellow
highlight LightRedR    ctermfg=Black       ctermbg=LightRed    guifg=Black      guibg=HotPink
highlight LightGreenR  ctermfg=Black       ctermbg=LightGreen  guifg=Black      guibg=SeaGreen1
highlight LightBlueR   ctermfg=Black       ctermbg=LightBlue   guifg=Black      guibg=SkyBlue
highlight LightYellowR ctermfg=Black       ctermbg=LightYellow guifg=Black      guibg=Orange

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
call matchadd('Attention'     , 'A\.I\.')
call matchadd('AttentionStr'  , 'A\.I\.\zs[^。]\+\(。\|$\)')
call matchadd('Caption'       , '【[^】]*】\|『[^』]*』\|「[^」]*」\|＜[^＞]*＞\|〈[^〉]*〉\|《[^》]*》\|（[^）]*）\|｛[^｝]*｝\|［[^］]*］\|〔[^〕]*〕')
call matchadd('Star'          , '☆\|★')
call matchadd('Circle'        , '○\|●\|◎\|◯')
call matchadd('Square'        , '□\|■')
call matchadd('Diamond'       , '◇\|◆')
call matchadd('Triangle'      , '△\|▲')
call matchadd('DTriangle'     , '▽\|▼')
call matchadd('EnclosedNumber', '①\|②\|③\|④\|⑤\|⑥\|⑦\|⑧\|⑨')
call matchadd('Note'          , '※')
call matchadd('NoteStr'       , '※\zs[^。]\+\(。\|$\)')

let w:my_highlights_already_loaded = 1
