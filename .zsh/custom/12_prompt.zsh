. ${HOME}/.sh/prompt.sh

colors=(red green blue cyan magenta yellow)

hostname_color=${colors[((0x`hostname | sha256sum - | grep -oe '[[:xdigit:]] '` % ${#colors} + 1))]}

vcs_info='%B%10<..<${vcs_info_msg_0_/${HOME}/~}%<<%b(${vcs_info_msg_1_}):%B%F{green}${vcs_info_msg_2_}%f%b:%B%10<..<${vcs_info_msg_3_}%<<%b[${vcs_info_msg_4_:- ${ambiguous_padding}}${vcs_info_msg_5_:- ${ambiguous_padding}}]${vcs_info_msg_6_}${vcs_info_msg_7_}'
custom_prompt='%B%n%b@%B%8>..>%F{${hostname_color}}%m%f%>>%b[%B%(?,%F{green}${ok}%f,%F{red}${ng}%f${bell})%b](%B%F{magenta}${his}%f%b:%B%h%b/%B%F{cyan}${job}%f%b:%B%1(j.%U%F{red}.)%j%1(j.%f%u.)%b/%B%F{yellow}${lvl}%f%b:%B%L%b):%(V"'${vcs_info}'"%B%20<..<%~%<<%b)%B${mps}%b
%B%D{${cal}%m/%d${tim}%T}%(!.#.${ps}) %b'
#RPROMPT='${vcs_info_msg_0_:+%B%(!.#.${rps})%b'${vcs_info}'}'

simple_prompt='%B%n%b@%F{${hostname_color}}%B%m%b%f:%B%F{magenta}%~%f%b%(!.#.$) '

PS1=${custom_prompt}
PS2='%_> '
SPROMPT='zsh: correct %R to %r [nyae]?'

# [ -z "${emoji_available}" ] &&  warningstr=! ||  warningstr=$'\U26A0'${ambiguous_padding}
[ -z "${emoji_available}" ] &&   stagedstr=+ ||   stagedstr=$'\U1F199'${ambiguous_padding}
[ -z "${emoji_available}" ] && unstagedstr=* || unstagedstr=$'\U1F195'${ambiguous_padding}

zstyle ':vcs_info:*' max-exports 8
zstyle ':vcs_info:*' enable bzr git hg p4 svn
zstyle ':vcs_info:*' formats       '%R' '%s' '%b' '%S' '%c' '%u' '%m'
zstyle ':vcs_info:*' actionformats '%R' '%s' '%b' '%S' '%c' '%u' '%m' "%B%F{red}**%a**%f%%b"
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:git:*' patch-format '(%B%n%%b/%B%c%%b/%B%a%%b patches)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*'   stagedstr "%B%K{cyan}${stagedstr}%k%b"
zstyle ':vcs_info:git:*' unstagedstr "%B%K{red}${unstagedstr}%k%b"

_update_vcs_info(){ LANG=C vcs_info; psvar=("${vcs_info_msg_0_}");}
add-zsh-hook precmd _update_vcs_info

_set_alarm(){ TMOUT=180; prompt prev;}
add-zsh-hook precmd _set_alarm

TRAPALRM(){ unset TMOUT; prompt_idle; zle .reset-prompt;}
