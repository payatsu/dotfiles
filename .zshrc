#!/bin/zsh

autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
autoload -Uz vcs_info
# autoload -Uz predict-on; predict-on
# autoload -Uz colors; colors
# autoload -Uz history-search-end
bindkey -e
setopt prompt_subst
[ ${TERM} = linux ] &&  ok=ok ||  ok=$'\U1F197 '
[ ${TERM} = linux ] &&  ng=ng ||  ng=$'\U1F196 '
[ ${TERM} = linux ] && his=h  || his=$'\U1F4DD '
[ ${TERM} = linux ] && job=j  || job=$'\U1F3C3 '
[ ${TERM} = linux ] && lvl=l  || lvl=$'\U1F41A '
[ ${TERM} = linux ] && cal=   || cal=$'\U1F4C6 '
[ ${TERM} = linux ] && tim=' '|| tim=$'\U231A '
[ ${TERM} = linux ] && mps=/  || mps=$'\U2199 '
[ ${TERM} = linux ] &&  ps=$  ||  ps=$'\U1F449 '
[ ${TERM} = linux ] && rps=?  || rps=$'\U1F4CA '
PROMPT='%B%n@%8>..>%m%>>:%20<..<%~%<<[%(?.%F{green}${ok}%f.%F{red}${ng}%f)](%F{magenta}${his}%f:%h, %F{cyan}${job}%f:%j, %F{yellow}${lvl}%f:%L)${mps}
%D{${cal}%F${tim}%T}%(!.#.${ps})%b '
PROMPT2='%_> '
SPROMPT='zsh: correct %R to %r [nyae]?'
RPROMPT='${_vcs_info}'
[ "${EMACS}" = t ] && unsetopt zle
setopt auto_cd
setopt auto_pushd
setopt always_to_end
setopt complete_aliases
zstyle ':completion:*' list-colors ''
setopt nolistbeep
setopt listpacked
LISTMAX=0
setopt hist_ignore_dups
setopt hist_save_nodups
setopt share_history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt correct
setopt nohup
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection
umask 022
export WORDCHARS=''
[ -x /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "" history-beginning-search-backward-end
# bindkey "" history-beginning-search-forward-end

zstyle ':vcs_info:*' max-exports 5
zstyle ':vcs_info:*' enable bzr git hg p4 svn
zstyle ':vcs_info:*' formats       '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m'
zstyle ':vcs_info:*' actionformats '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m' '%F{red}<<!%a>>%f'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:git:*' formats       '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m'
zstyle ':vcs_info:git:*' actionformats '%B%r%%b(%s):%B%b%%b' '%c' '%u' '%m' '%F{red}<<!%a>>%f'
zstyle ':vcs_info:git:*' check-for-changes true
[ ${TERM} = linux ] &&   stagedstr=+ ||   stagedstr=$'\U1F199 '
[ ${TERM} = linux ] && unstagedstr=* || unstagedstr=$'\U1F195 '
zstyle ':vcs_info:git:*'   stagedstr "%B%K{cyan}${stagedstr}%k%b"
zstyle ':vcs_info:git:*' unstagedstr "%B%K{red}${unstagedstr}%k%b"
function _update_vcs_info()
{
	LANG=C vcs_info
	[ -n "${vcs_info_msg_0_}" ] && _vcs_info="%B%(!.#.${rps})%b${vcs_info_msg_0_}[${vcs_info_msg_1_:= }${vcs_info_msg_2_:= }]${vcs_info_msg_3_}${vcs_info_msg_4_}" || _vcs_info=
}
add-zsh-hook precmd _update_vcs_info

[ "${TERM}" = dumb ] && alias ls='ls -FGlhp' || alias ls='ls -FGlhp --color=auto'
[ "${TERM}" = dumb ] && alias grep='grep -Hn --exclude-dir="*.svn"' || alias grep='grep -Hn --exclude-dir="*.svn" --color=auto'
alias g='grep'
alias l='ls'
alias less='less -R'
alias lv='lv -c'
alias tgif='tgif -geometry 960x1000'
alias xdvi='xdvi -geometry 900x1100-0+0'
alias indent='indent -bad -bap -bbb -bbo -bc -br -brs -cdb -cdw -ce -hnl -i4 -l80 -lp -ncs -nfc1 -npcs -nprs -npsl -nsaf -nsai -nsaw -nss -sc -ts4'
alias -s txt=view
alias -s tar.gz='tar xzf'
alias -s tgz='tar xzf'
alias -s tar.bz2='tar xjf'
alias -s tar.xz='tar xJf'
alias gcc='gcc         -std=c11   -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias g++='g++         -std=c++11 -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias clang='clang     -std=c11   -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias clang++='clang++ -std=c++11 -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings -stdlib=libc++ -lc++abi'
prepend-to-path(){ [ -d $1 ] || return 1; echo $PATH | grep -qe $1 || export PATH=$1:${PATH} }
append-to-path() { [ -d $1 ] || return 1; echo $PATH | grep -qe $1 || export PATH=${PATH}:$1 }
[ -f ${HOME}/.zshrc.local ] && . ${HOME}/.zshrc.local
