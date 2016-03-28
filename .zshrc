#!/bin/zsh

autoload -Uz compinit
compinit
bindkey -e
case ${UID} in
	0) PROMPT='%n@%m:%~# ';;
	*) PROMPT='%n@%m:%~$ ';;
esac
PROMPT2='%_> '
SPROMPT='zsh: correct '%R' to '%r' [nyae]?'
setopt prompt_subst
autoload -Uz add-zsh-hook
precmd_rprompt()
{
	RPROMPT=\[`date '+%F %T'`\]
}
add-zsh-hook precmd precmd_rprompt
setopt share_history
setopt hist_ignore_dups
setopt hist_save_nodups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# autoload -Uz history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "" history-beginning-search-backward-end
# bindkey "" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd
setopt correct
setopt listpacked
setopt nolistbeep
LISTMAX=0
autoload -Uz predict-on
# predict-on
autoload -Uz colors
colors
zstyle ':completion:*' list-colors ''
umask 022
setopt no_hup
[ -x /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found
export WORDCHARS=''
setopt complete_aliases

autoload -Uz vcs_info
zstyle ':vcs_info:*' max-exports 5
zstyle ':vcs_info:*' enable bzr git hg p4 svn
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b:%m]%F{red}<<!%a>>%f'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
autoload -Uz is-at-least
if is-at-least 4.3.10; then
	zstyle ':vcs_info:git:*' formats       '%b of %r(%s)' '%c' '%u' '%m'
	zstyle ':vcs_info:git:*' actionformats '%b of %r(%s)' '%c' '%u' '%m' '%F{red}<<!%a>>%f'
	zstyle ':vcs_info:git:*' check-for-changes true
	zstyle ':vcs_info:git:*' stagedstr '%F{red}S%f'
	zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}U%f'
fi
function _update_vcs_info_msg() {
	LANG=en_US.UTF-8 vcs_info
	local info
	if [ -n "${vcs_info_msg_0_}" ]; then
		info=" ${vcs_info_msg_0_}[${vcs_info_msg_1_:= }${vcs_info_msg_2_:= }]${right}${vcs_info_msg_3_}${vcs_info_msg_4_}"
	fi
	RPROMPT="#${info} `date '+%F %T'`"
}
add-zsh-hook precmd _update_vcs_info_msg

[ "${TERM}" != dumb ] && alias ls='ls --color=auto'
[ "${TERM}" != dumb ] && alias grep='grep --color=auto'
alias l='ls -FGlhp'
alias less='less -R'
alias lv='lv -c'
alias tgif='tgif -geometry 960x1000'
alias xdvi='xdvi -geometry 900x1100-0+0'
alias my_indent='indent -bad -bap -bbb -bbo -bc -br -brs -cdb -cdw -ce -hnl -i4 -l80 -lp -ncs -nfc1 -npcs -nprs -npsl -nsaf -nsai -nsaw -nss -sc -ts4'
alias -s txt=view
alias -s tar.gz='tar xzf'
alias -s tgz='tar xzf'
alias -s tar.bz2='tar xjf'
alias -s tar.xz='tar xJf'
alias gcc='gcc         -std=c11   -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias g++='g++         -std=c++11 -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias clang='clang     -std=c11   -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings'
alias clang++='clang++ -std=c++11 -Wall -Wextra -Weffc++ -Wcast-align -Wcast-qual -Wformat -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings -stdlib=libc++ -lc++abi'
[ -f ${HOME}/.zshrc.local ] && . ${HOME}/.zshrc.local
