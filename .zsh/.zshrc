#!/bin/zsh

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
[ ${TERM} = linux ] &&  ok=ok   ||  ok=$'\U1F197 '
[ ${TERM} = linux ] &&  ng=ng   ||  ng=$'\U1F196 '
[ ${TERM} = linux ] && his=h    || his=$'\U1F4DD '
[ ${TERM} = linux ] && job=j    || job=$'\U1F3C3 '
[ ${TERM} = linux ] && lvl=l    || lvl=$'\U1F41A '
[ ${TERM} = linux ] && cal=     || cal=$'\U1F4C6 '
[ ${TERM} = linux ] && tim=' '  || tim=$'\U231A '
[ ${TERM} = linux ] && mps=/    || mps=$'\U2199 '
[ ${TERM} = linux ] &&  ps='$ ' ||  ps=$'\U1F449 '
[ ${TERM} = linux ] && rps=?    || rps=$'\U1F4CA '
PROMPT='%B%n@%8>..>%m%>>:%20<..<%~%<<[%(?.%F{green}${ok}%f.%F{red}${ng}%f)](%F{magenta}${his}%f:%h, %F{cyan}${job}%f:%j, %F{yellow}${lvl}%f:%L)${mps}
%D{${cal}%m/%d${tim}%T}%(!.#.${ps})%b'
PROMPT2='%_> '
SPROMPT='zsh: correct %R to %r [nyae]?'
RPROMPT='${_vcs_info}'
[ "${EMACS}" = t ] && unsetopt zle
setopt auto_cd
setopt auto_pushd
setopt always_to_end
setopt complete_aliases
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _complete _expand _match _prefix _approximate _list _history
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
zle -N edit-command-line
bindkey '^xe' edit-command-line
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
alias run-help > /dev/null 2>&1 && unalias run-help
[ ${TERM} = dumb ] && color= || color=' --color=auto'
alias du='du -h'
alias df='df -h'
alias grep="grep --exclude-dir='*.svn'${color}"
alias g='grep'
alias ls="ls -FGlhp${color}"
alias l='ls'
alias less='less -R'
alias lv='lv -c'
alias tgif='tgif -geometry 960x1000'
alias xdvi='xdvi -geometry 900x1100-0+0'
alias indent='indent -bad -bap -bbb -bbo -bc -br -brs -cdb -cdw -ce -hnl -i4 -l80 -lp -ncs -nfc1 -npcs -nprs -npsl -nsaf -nsai -nsaw -nss -sc -ts4'
alias gcc='gcc         -std=c11   -pedantic -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wfloat-equal -Wshadow -Wwrite-strings'
alias g++='g++         -std=c++11 -pedantic -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wfloat-equal -Wshadow -Wwrite-strings'
alias clang='clang     -std=c11   -pedantic -Weverything -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias clang++='clang++ -std=c++11 -pedantic -Weverything -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings -stdlib=libc++ -lc++abi'
alias gtags='gtags -c'
alias -s txt=view
alias -s tar.gz='tar xzf'
alias -s tgz='tar xzf'
alias -s tar.bz2='tar xjf'
alias -s tar.xz='tar xJf'
prepend-to(){ [ -d $1 ] || return 1; eval [ -z \"\$$2\" ] && export $2=$1 && return 0; eval echo \$$2 | tr : '\n' | \grep -qe ^$1\$ || eval export $2=$1:\$$2 }
append-to() { [ -d $1 ] || return 1; eval [ -z \"\$$2\" ] && export $2=$1 && return 0; eval echo \$$2 | tr : '\n' | \grep -qe ^$1\$ || eval export $2=\$$2:$1 }
[ -f ${ZDOTDIR}/.zshrc.local ] && . ${ZDOTDIR}/.zshrc.local
