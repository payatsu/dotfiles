#!/bin/zsh

prepend(){ [ -d "${1}" -a -n "${2}" ] || return; eval [ -z \"\${${2}}\" ] && export ${2}=${1} && return; eval echo \${${2}} | tr : '\n' | grep -qe ^${1}\$ || eval ${2}=${1}:\${${2}};}
append() { [ -d "${1}" -a -n "${2}" ] || return; eval [ -z \"\${${2}}\" ] && export ${2}=${1} && return; eval echo \${${2}} | tr : '\n' | grep -qe ^${1}\$ || eval ${2}=\${${2}}:${1};}
remove() { [ -d "${1}" -a -n "${2}" ] || return; eval ${2}=`eval echo \\\${${2}} | sed -e "s%\(^\|:\)${1}\(:\|\$\)%\\1\\2%g;s/::/:/g;s/^://;s/:\$//"`;}
lrotate(){ [ -n "${1}" ] || return; eval ${1}=`eval echo \\\${${1}} | sed -e 's/^\([^:]\+\):\(.\+\)$/\2:\1/;s/::/:/g;s/^://;s/:$//'`;}
rrotate(){ [ -n "${1}" ] || return; eval ${1}=`eval echo \\\${${1}} | sed -e 's/^\(.\+\):\([^:]\+\)$/\2:\1/;s/::/:/g;s/^://;s/:$//'`;}
my(){ PATH=${MYPATH}:${PATH} eval "$@";}
[ -f ${ZDOTDIR}/.zshrc.local.pre ] && . ${ZDOTDIR}/.zshrc.local.pre
autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook
autoload -Uz edit-command-line
autoload -Uz chpwd_recent_dirs cdr
autoload -Uz vcs_info
autoload -Uz run-help run-help-git run-help-p4 run-help-svn run-help-openssl run-help-sudo
# autoload -Uz predict-on; predict-on
# autoload -Uz colors; colors
# autoload -Uz history-search-end
bindkey -e
setopt prompt_subst
[ "${TERM}" = xterm  ] && export TERM=xterm-256color
[ "${TERM}" = screen ] && export TERM=screen-256color
[ "${TERM}" = screen-256color ] && [ -n "${TERMCAP}" ] && export TERMCAP=`echo "${TERMCAP}" | sed -e 's/Co#8/Co#256/g'`
[ "${TERM}" = linux ] &&  ok=OK   ||  ok=$'\U1F197 '
[ "${TERM}" = linux ] &&  ng=NG   ||  ng=$'\U1F196 '
[ "${TERM}" = linux ] && his=h    || his=$'\U1F4DD '
[ "${TERM}" = linux ] && job=j    || job=$'\U1F3C3 '
[ "${TERM}" = linux ] && lvl=l    || lvl=$'\U1F41A '
[ "${TERM}" = linux ] && cal=     || cal=$'\U1F4C6 '
[ "${TERM}" = linux ] && tim=' '  || tim=$'\U231A '
[ "${TERM}" = linux ] && mps=/    || mps=$'\U2199 '
[ "${TERM}" = linux ] &&  ps='$ ' ||  ps=$'\U1F449 '
[ "${TERM}" = linux ] && rps=?    || rps=$'\U1F4CA '
colors=(red green blue cyan magenta yellow)
hostname_color=${colors[((0x`hostname | sha1sum - | grep -oe '[[:xdigit:]] '` % $#colors + 1))]}
PROMPT='%B%n@%8>..>%F{${hostname_color}}%m%f%>>:%20<..<%~%<<[%(?.%F{green}${ok}%f.%F{red}${ng}%f)](%F{magenta}${his}%f:%h, %F{cyan}${job}%f:%1(j.%U%F{red}.)%j%1(j.%f%u.), %F{yellow}${lvl}%f:%L)${mps}
%D{${cal}%m/%d${tim}%T}%(!.#.${ps})%b'
PROMPT2='%_> '
SPROMPT='zsh: correct %R to %r [nyae]?'
RPROMPT='${_vcs_info}'
[ "${EMACS}" = t ] && unsetopt zle
setopt auto_cd
setopt auto_pushd

setopt complete_aliases
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _complete _expand _match _prefix _list _approximate # _history
zstyle ':completion:*:processes' command "ps -u ${USER} -o pid,stat,%cpu,%mem,cputime,command"
setopt nolistbeep
setopt listpacked
LISTMAX=0
setopt hist_ignore_dups
setopt hist_save_nodups
setopt share_history
HISTFILE=${ZDOTDIR}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt correct
setopt nohup
setopt interactive_comments
zle -N edit-command-line
bindkey '^xe' edit-command-line
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection
umask 022
export WORDCHARS=''
[ -r /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "" history-beginning-search-backward-end
# bindkey "" history-beginning-search-forward-end
[ "${TERM}" = linux ] &&  warningstr=! ||  warningstr=$'\U26A0 '
[ "${TERM}" = linux ] &&   stagedstr=+ ||   stagedstr=$'\U1F199 '
[ "${TERM}" = linux ] && unstagedstr=* || unstagedstr=$'\U1F195 '
zstyle ':vcs_info:*' max-exports 5
zstyle ':vcs_info:*' enable bzr git hg p4 svn
zstyle ':vcs_info:*' formats       '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m'
zstyle ':vcs_info:*' actionformats '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m' "%F{red}${warningstr}%a%f"
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:git:*' formats       '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m'
zstyle ':vcs_info:git:*' actionformats '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m' "%F{red}${warningstr}%a%f"
zstyle ':vcs_info:git:*' patch-format  '(%a patches)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*'   stagedstr "%B%K{cyan}${stagedstr}%k%b"
zstyle ':vcs_info:git:*' unstagedstr "%B%K{red}${unstagedstr}%k%b"
_update_vcs_info()
{
	LANG=C vcs_info
	[ -n "${vcs_info_msg_0_}" ] && _vcs_info="%B%(!.#.${rps})%b${vcs_info_msg_0_}[${vcs_info_msg_1_:=  }${vcs_info_msg_2_:=  }]${vcs_info_msg_3_}${vcs_info_msg_4_}" || _vcs_info=
}
add-zsh-hook precmd _update_vcs_info
alias run-help > /dev/null 2>&1 && unalias run-help
[ "${TERM}" = dumb ] && color= || color=' --color=auto'
echo | grep -e '' --exclude-dir='*.svn' > /dev/null 2>&1 && grep_exclude_dir="--exclude-dir='*.svn'"
ls --group-directories-first /dev/null > /dev/null 2>&1 && ls_group_directories_first=--group-directories-first
alias addr2line='addr2line -C -f'
alias ag='ag --nogroup'
alias du='du -h'
alias df='df -h'
alias gcov='gcov -bdflmr'
alias gdb='gdb -q'
alias grep="grep ${grep_exclude_dir}${color}"
alias g='grep'
alias gtags='gtags -c'
alias hw='hw --no-group -e'
alias ls="ls -FGlhpX ${ls_group_directories_first}${color}"
alias l='ls'
alias less='less -MNRSx4'
alias lv='lv -c'
alias nm='nm -C'
alias od='od -Ax -tx1z -v'
alias readelf='readelf -W'
alias pstree='pstree -ahnp'
alias pt='pt --nogroup'
alias tgif='tgif -geometry 960x1000'
whence -p  vim > /dev/null &&  vim --version | grep -qe '+clientserver' && alias  vim='vim --servername VIM'
whence -p gvim > /dev/null && gvim --version | grep -qe '+clientserver' && alias gvim='gvim --servername VIM'
alias xdvi='xdvi -geometry 900x1100-0+0'
alias indent='indent -bad -bap -bbb -bbo -bc -br -brs -cdb -cdw -ce -hnl -i4 -l80 -lp -ncs -nfc1 -npcs -nprs -npsl -nsaf -nsai -nsaw -nss -sc -ts4'
alias gcc="gcc -std=c11   -march=native -Wextra -Wcast-align -Wstrict-aliasing -Wshadow `LANG=C gcc -Q --help=warnings,^joined,^separate,c   | grep -v '\[enabled\]\|-Wc90-c99-compat\|-Wtraditional[^-]\|-Werror\|-Wsystem-headers' | grep -oe '-W[[:graph:]]\+' | xargs echo`"
alias g++="g++ -std=c++14 -march=native -Wextra -Wcast-align -Wstrict-aliasing -Wshadow `LANG=C g++ -Q --help=warnings,^joined,^separate,c++ | grep -v '\[enabled\]\|-Wc90-c99-compat\|-Wtraditional[^-]\|-Werror\|-Wsystem-headers' | grep -oe '-W[[:graph:]]\+' | xargs echo`"
alias clang='clang     -std=c11   -march=native -Wpedantic -Weverything -Wall -Wextra -Wcast-align -Wcast-qual -Wstrict-aliasing -Wpointer-arith -Wshadow -Wformat -Wwrite-strings -Weffc++ -Woverloaded-virtual'
alias clang++='clang++ -std=c++14 -march=native -Wpedantic -Weverything -Wall -Wextra -Wcast-align -Wcast-qual -Wstrict-aliasing -Wpointer-arith -Wshadow -Wformat -Wwrite-strings -Weffc++ -Woverloaded-virtual -stdlib=libc++ -lc++abi'
# alias ctags='ctags --declarations --defines --globals --members --typedefs --typedefs-and-c++'
alias -s txt=view
alias -s tar.gz='tar xzf'
alias -s tgz='tar xzf'
alias -s tar.bz2='tar xjf'
alias -s tar.xz='tar xJf'
[ -f ${ZDOTDIR}/.zshrc.local.post ] && . ${ZDOTDIR}/.zshrc.local.post || true
