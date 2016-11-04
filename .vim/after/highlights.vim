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
highlight Hi01  ctermfg=Red          ctermbg=NONE guifg='firebrick1'      guibg=NONE
highlight Hi02  ctermfg=DarkBlue     ctermbg=NONE guifg='dodger blue'     guibg=NONE
highlight Hi03  ctermfg=LightGreen   ctermbg=NONE guifg='lime green'      guibg=NONE
highlight Hi04  ctermfg=LightMagenta ctermbg=NONE guifg='purple'          guibg=NONE
highlight Hi05  ctermfg=DarkYellow   ctermbg=NONE guifg='orange'          guibg=NONE
highlight Hi06  ctermfg=Magenta      ctermbg=NONE guifg='VioletRed1'      guibg=NONE
highlight Hi07  ctermfg=LightBlue    ctermbg=NONE guifg='sky blue'        guibg=NONE
highlight Hi08  ctermfg=DarkGreen    ctermbg=NONE guifg='SeaGreen1'       guibg=NONE
highlight Hi09  ctermfg=LightRed     ctermbg=NONE guifg='hot pink'        guibg=NONE
highlight Hi10  ctermfg=Yellow       ctermbg=NONE guifg='light goldenrod' guibg=NONE
highlight Rev01 ctermfg=Black ctermbg=Red          guifg=Black guibg='firebrick1'
highlight Rev02 ctermfg=Black ctermbg=DarkBlue     guifg=Black guibg='dodger blue'
highlight Rev03 ctermfg=Black ctermbg=LightGreen   guifg=Black guibg='lime green'
highlight Rev04 ctermfg=Black ctermbg=LightMagenta guifg=Black guibg='purple'
highlight Rev05 ctermfg=Black ctermbg=DarkYellow   guifg=Black guibg='orange'
highlight Rev06 ctermfg=Black ctermbg=Magenta      guifg=Black guibg='VioletRed1'
highlight Rev07 ctermfg=Black ctermbg=LightBlue    guifg=Black guibg='sky blue'
highlight Rev08 ctermfg=Black ctermbg=DarkGreen    guifg=Black guibg='SeaGreen1'
highlight Rev09 ctermfg=Black ctermbg=LightRed     guifg=Black guibg='hot pink'
highlight Rev10 ctermfg=Black ctermbg=Yellow       guifg=Black guibg='light goldenrod'

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
