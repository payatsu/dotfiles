if exists("b:current_syntax")
  finish
endif

syntax match Grayout        display "前記\|該"
syntax match Caption        display "<[^>]*>\|【[^】]*】\|『[^』]*』\|「[^」]*」\|〈[^〉]*〉\|《[^》]*》\|（[^）]*）\|｛[^｝]*｝\|［[^］]*］\|〔[^〕]*〕"
syntax match Star           display "☆\|★"
syntax match Circle         display "○\|●\|◎\|◯"
syntax match Square         display "□\|■"
syntax match Diamond        display "◇\|◆"
syntax match Triangle       display "△\|▲"
syntax match DTriangle      display "▽\|▼"
syntax match EnclosedNumber display "①\|②\|③\|④\|⑤\|⑥\|⑦\|⑧\|⑨"
syntax match Note           display "※.*"

highlight Grayout        ctermfg=Gray         ctermbg=NONE   cterm=NONE           guifg=Gray40      guibg=bg
highlight Caption        ctermfg=NONE         ctermbg=NONE   cterm=bold,underline guifg=fg          guibg=bg     gui=bold,underline
highlight Star           ctermfg=Yellow       ctermbg=NONE   cterm=bold           guifg=Yellow      guibg=bg     gui=bold
highlight Circle         ctermfg=Red          ctermbg=NONE   cterm=bold           guifg=Red         guibg=bg     gui=bold
highlight Square         ctermfg=LightMagenta ctermbg=NONE   cterm=bold           guifg=Violet      guibg=bg     gui=bold
highlight Diamond        ctermfg=Green        ctermbg=NONE   cterm=bold           guifg=Green       guibg=bg     gui=bold
highlight Triangle       ctermfg=DarkRed      ctermbg=NONE   cterm=bold           guifg=DarkRed     guibg=bg     gui=bold
highlight DTriangle      ctermfg=LightBlue    ctermbg=NONE   cterm=bold           guifg=LightBlue   guibg=bg     gui=bold
highlight EnclosedNumber ctermfg=Magenta      ctermbg=NONE   cterm=bold           guifg=DarkMagenta guibg=bg     gui=bold
highlight Note           ctermfg=Gray         ctermbg=Yellow cterm=bold           guifg=Gray20      guibg=Orange gui=bold
